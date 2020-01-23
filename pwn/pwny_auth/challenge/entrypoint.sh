#!/bin/bash

socat -dd -T60 TCP-LISTEN:8000,reuseaddr,fork,su=newbie EXEC:/home/newbie/pwny_auth,stderr
