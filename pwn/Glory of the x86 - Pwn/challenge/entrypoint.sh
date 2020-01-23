#!/bin/bash

socat -dd -T60 TCP-LISTEN:8000,reuseaddr,fork,su=x86hacker EXEC:/home/x86hacker/prog,stderr
