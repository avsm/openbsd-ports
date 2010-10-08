#!/usr/bin/env ruby
# Copyright (c) 2008-2010, Edd Barrett <vext01@gmail.com>
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# 
# RBlatter
# $Id: eqnparser.rb,v 1.1.1.1 2010/08/20 12:04:30 edd Exp $
#
# Parse equation and put into data structure.

require "subsetconf"

=begin
Parse subset equations and bomb out if bad
=end
class EqnParser

	attr_reader :configs

	# Initialise + Parse
	def initialize(eqn)
		@configs = []
		@eqn = eqn
		@fileTypes = ["doc", "src", "run", "bin"]

		parse
	end

	private
	def parse
		parts = @eqn.split ":"
		for part in parts do

			subparts = part.split ","

			if subparts.size < 2 then
				puts "*error: malformed equation"
				exit 1
			end

			pm = subparts[0][0..0] # +/-
			inc = true
			if pm == '-' then
				inc = false
			end
			pkg = subparts[0]
			pkg = pkg[1..pkg.length]
			conf = SubsetConf.new pkg, inc

			for subpart in subparts[1..subparts.length] do
				subpart.chomp!
				if @fileTypes.index subpart then
					conf.enableFileType subpart
				else
					print "*error: bad filetype: "
					puts subpart
					exit 1
				end
			end
			@configs << conf
		end
	end
end
