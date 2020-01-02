#!/usr/bin/python3
import pyqrcode
import random
import string
import sys

def gen_rand_string(length=32):
    charset = list(string.printable[:62])
    random.shuffle(charset)
    return ''.join(charset)[:length]

flag = 'shellmates{4lR1g|-|t_@lriGh7_1_tH1nK_y0u`R3_f4st_en0ugh}'
rand_string = gen_rand_string()
qr_code = pyqrcode.create(rand_string).terminal()

sys.stdout.write("Hello there Soldier! Let's see how fast you are, you got only 1 second!")
sys.stdout.write(qr_code)
sys.stdout.write('Decoded string: ')
sys.stdout.flush()

if sys.stdin.readline().strip() == rand_string:
    sys.stdout.write('[+] Congratulations! Here is your flag: {}'.format(flag))
else:
    sys.stdout.write('[-] Wrong!')

sys.stdout.flush()
