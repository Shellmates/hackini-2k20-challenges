#!/bin/bash
socat tcp-l:6666,reuseaddr,fork,keepalive exec:./vim_jail
