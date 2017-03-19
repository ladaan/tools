#!/bin/bash
cvlc "$1" --sout '#standard{access=http,mux=ogg,dst=192.168.88.149:8080}' 2 >&1 /dev/null
