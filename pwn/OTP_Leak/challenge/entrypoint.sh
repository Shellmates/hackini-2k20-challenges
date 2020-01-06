#!/bin/bash

socat -dd -T60 TCP-LISTEN:8000,reuseaddr,fork,su=CryptoBoy EXEC:/home/CryptoBoy/otp_leak,stderr
