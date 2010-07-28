#!${LOCALBASE}/bin/lua
-- $OpenBSD: yt.lua,v 1.29 2010/07/28 22:52:28 jsg Exp $
-- Fetch videos from YouTube.com/Videos.Google.com, and convert to MPEG.
-- Written by Pedro Martelletto and Martynas Venckus.  Public domain.
-- Example: lua yt.lua http://www.youtube.com/watch?v=c5uoo1Kl_uA

getopt = require("getopt")
http = require("socket.http")
ltn12 = require("ltn12")

-- Set this to a command capable of talking HTTP and following 3XX requests.
fetch = "ftp <arguments> -o <file> <url>"

-- Default arguments for the fetch command.
arguments = ""

-- Set this to a command capable of converting from FLV to MPEG.
convert = "ffmpeg -y -i <flv> -b 1000k -f mp4 -vcodec mpeg4 -acodec libfaac -ab 128k <mp4> 1>/dev/null 2>&1"

-- Set this to the base location where to fetch YouTube videos from.
base_url = "http://www.youtube.com/get_video_info"

-- Usage and supported options.
prog = {
   name = arg[0],
   usage = "[-C] [-n] [-o=output] url ...",
}
options = Options {
   Option {{"C"}, "continue previous transfer"},
   Option {{"n"}, "do not convert video"},
   Option {{"o"}, "change output filename", "Req", "filename"},
}

-- from lua-users.org StringRecipes
function url_decode(str)
   str = string.gsub (str, "+", " ")
   str = string.gsub (str, "%%(%x%x)",
       function(h) return string.char(tonumber(h,16)) end)
   str = string.gsub (str, "\r\n", "\n")
   return str
end

-- Process arguments.  Show usage.
urls, opts, errors = getopt.getOpt(arg, options)
if #errors > 0 or urls.n < 1 then
   getopt.dieWithUsage()
end

-- Build arguments for the fetch command.
if opts.C then
   arguments = arguments .. "-C"
end

-- Fetch one or more URL.
for i = 1, table.getn(urls) do
   url = urls[i]

   -- Convert embedded links to the correct form.
   url = string.gsub(url, "/v/", "/watch?v=")

   -- Fetch the page holding the embedded video.
   io.stderr:write(string.format("Getting %s ...\n", url))
   t = {  }
   assert(http.request{
      url = url,
      sink = ltn12.sink.table(t),
      proxy = os.getenv("http_proxy")
   })
   body = table.concat(t)

   -- Look for the video title.
   pattern = "<title>%s*(.-)%s*</title>"
   title = assert(string.match(body, pattern))

   -- Fetch high quality if available, just take the first format for now
   --  5  320x 240 H.263/MP3 mono FLV
   --  6  320x 240 H.263/MP3 mono FLV
   -- 13  176x 144 3GP/AMR mono 3GP 
   -- 17  176x 144 3GP/AAC mono 3GP
   -- 18  480x 360 480x270 H.264/AAC stereo MP4
   -- 22 1280x 720 H.264/AAC stereo MP4
   -- 34  320x 240 H.264/AAC stereo FLV
   -- 35  640x 480 640x360 H.264/AAC stereo FLV
   -- 37 1920x1024 H.264/AAC MP4 AVC
   mpeg4 = false
   pattern = "fmt_map=([%d]+)"
   if (string.match(body, pattern) ~= nil) then
      format = string.match(body, pattern)
      -- format 37 isn't in fmt_map so fake it
--[[
      if (string.match(body, "IS_HD_AVAILABLE':%s*true") ~= nil) then
         format = "37"
      end
]]--
      nf = tonumber(format)
      if nf == 18 or nf == 22 or nf == 37 then
         mpeg4 = true
      end
      fmt = "&fmt=" .. format
   else
      fmt = ""
   end

   -- Build a name for the files the video will be stored in.
   if opts.o then
      file = opts.o
   else
      file = string.gsub(title, "[^%w-]+", "_")
      file = string.lower(file)
   end

   -- Build flv and mp4 file names.
   if file == "-" then
      opts.n = 0
      flv = file
   else
      flv = file .. ".flv"
   end
   mp4 = file .. ".mp4"

   -- Escape the file names.
   e_flv = string.format("%q", flv)
   e_mp4 = string.format("%q", mp4)

   -- Look for the video ID.
   pattern = "VIDEO_ID':%s*'([^\']*)'"
   video_id = string.match(body, pattern)

   -- Check for error such as "This video is not available in your country."
   error_pattern = "class=\"yt%-alert%-content\">%s+(.-)%s*\n*</div>"
--[[
   err = string.match(body, error_pattern)
   if err then
      io.stderr:write(err .. "\n")
      return
   end
]]--

   if video_id then
      url = string.format("%q", base_url .. "?video_id=" .. video_id
         .. "&eurl=&el=detailpage&ps=default&gl=US&hl=en" .. fmt)

      -- Look for the download URL
      url = string.match(url, "\"(.*)\"")
      io.stderr:write(string.format("Getting %s ...\n", url))
      t = {  }
      assert(http.request{
         url = url,
         sink = ltn12.sink.table(t),
         proxy = os.getenv("http_proxy")
      })
      body = table.concat(t)
      encurl = string.match(body, "7C(http.-id%%3D.-)%%")
      url = string.format("\"%s\"", url_decode(encurl))
   else
      -- We assume it's Google Video URL.
      pattern = "/googleplayer.swf%?videoUrl(.-)thumbnailUrl"
      url = assert(string.match(body, pattern))
      url = string.gsub (url, "\\x", "%%")
      url = url_decode(url)
      url = string.gsub (url, "^=", "")
      url = string.format("%q", url)
   end

   -- Fetch the video.
   if mpeg4 == true then
        e_file = e_mp4
        o_file = mp4
   else
        e_file = e_flv
        o_file = flv
   end
   
   cmd = string.gsub(fetch, "<(%w+)>", { arguments = arguments,
      url = url, file = e_file })
   assert(os.execute(cmd) == 0, "Failed")

   -- Convert it to MPEG.
   if opts.n or mpeg4 == true then
      io.stderr:write("Done. Video saved in " .. o_file .. ".\n")
   else
      cmd = string.gsub(convert, "<(%w+)>", { flv = e_flv, mp4 = e_mp4 })
      io.stderr:write("Converting ...\n")
      assert(os.execute(cmd) == 0, "Failed")
      os.remove(flv)
      io.stderr:write("Done. Video saved in " .. mp4 .. ".\n")
   end
end

