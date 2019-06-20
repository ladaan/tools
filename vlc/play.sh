#!/bin/bash
  
# specify listening port (default is 8080)
if [ -z $2 ]
then
  port=8080
else
  port=$2
fi

# set mux (default is ts)
if [ -z $3 ]
then
  mux=ts
else
  mux=$3
fi

# mux options
# name	description
# mpeg1	MPEG-1 multiplexing - recommended for portability. Only works with mp1v video and mpga audio, but works on all known players
# ts	MPEG Transport Stream, primarily used for streaming MPEG. Also used in DVDs
# ps	MPEG Program Stream, primarily used for saving MPEG data to disk.
# mp4	MPEG-4 mux format, used only for MPEG-4 video and MPEG audio.
# avi	AVI
# asf	ASF
# dummy	dummy output, can be used in creation of MP3 files.
# ogg	Xiph.org's ogg container format. Can contain audio, video, and metadata

# plays continuesly
cvlc "$1" --sout "#gather:std{access=http,mux=$mux,dst=192.168.88.149:$port}" --sout-keep --loop # &>/dev/null
#cvlc "$1" --sout "#http{mux=ffmpeg{mux=flv},dst=192.168.88.149:$port}" --sout-keep --loop # &>/dev/null

# cvlc "$1" --sout "#standard{access=http,mux=ogg,dst=192.168.88.149:$port}" --sout-keep --loop # &>/dev/null
# cvlc "$1" --sout "#standard{access=http,mux=ts,dst=192.168.88.149:$port}" --sout-keep --loop --start-time 3600 # &>/dev/null


# cvlc $1 --sout "#transcode{vcodec=mp4v,acodec=mpga,vb=800,ab=128}:gather:std{access=http,mux=ogg,dst=192.168.88.149:$port}" --sout-keep --loop # &>/dev/null

# cvlc "$1" -v --sout "#transcode{vcodec=theo,vb=800,scale=1,acodec=vorb,ab=128,channels=2,samplerate=44100}:gather:std{access=http,mux=asfh,dst=:$port}" --sout-keep
