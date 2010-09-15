/*
 * sndio play and grab interface
 * Copyright (c) 2010 Jacob Meuser
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include <sndio.h>
#include "libavformat/avformat.h"

#include "sndio_common.h"

static av_cold int audio_read_header(AVFormatContext *s1,
                                     AVFormatParameters *ap)
{
    AudioData *s = s1->priv_data;
    AVStream *st;
    int ret;

    if (ap->sample_rate <= 0 || ap->channels <= 0)
        return AVERROR(EINVAL);

    st = av_new_stream(s1, 0);
    if (!st)
        return AVERROR(ENOMEM);

    s->sample_rate = ap->sample_rate;
    s->channels    = ap->channels;

    ret = ff_sndio_open(s1, 0, s1->filename);
    if (ret < 0)
        return AVERROR(EIO);

    /* take real parameters */
    st->codec->codec_type  = AVMEDIA_TYPE_AUDIO;
    st->codec->codec_id    = s->codec_id;
    st->codec->sample_rate = s->sample_rate;
    st->codec->channels    = s->channels;

    av_set_pts_info(st, 64, 1, 1000000);  /* 64 bits pts in us */
    return 0;
}

static int audio_read_packet(AVFormatContext *s1, AVPacket *pkt)
{
    AudioData *s = s1->priv_data;
    int ret;
    int64_t cur_time, bdelay;

    if ((ret = av_new_packet(pkt, s->buffer_size)) < 0)
        return ret;

    ret = sio_read(s->hdl, pkt->data, pkt->size);
    if (ret == 0 || sio_eof(s->hdl)) {
        av_free_packet(pkt);
        pkt->size = 0;
        return AVERROR_EOF;
    }

    pkt->size   = ret;
    s->softpos += ret;

    /* compute pts of the start of the packet */
    cur_time = av_gettime();

    bdelay = ret + s->hwpos - s->softpos;

    /* convert to wanted units */
    pkt->pts = cur_time - ((bdelay * 1000000) /
        (s->bps * s->channels * s->sample_rate));

    return 0;
}

static av_cold int audio_read_close(AVFormatContext *s1)
{
    AudioData *s = s1->priv_data;

    ff_sndio_close(s);
    return 0;
}

AVInputFormat sndio_demuxer = {
    .name           = "sndio",
    .long_name      = NULL_IF_CONFIG_SMALL("sndio audio capture"),
    .priv_data_size = sizeof(AudioData),
    .read_header    = audio_read_header,
    .read_packet    = audio_read_packet,
    .read_close     = audio_read_close,
    .flags          = AVFMT_NOFILE,
};
