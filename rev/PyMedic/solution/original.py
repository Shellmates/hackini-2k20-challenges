#!/bin/env python
from binascii import unhexlify


FLAG = '7369676f686867736d7a714253453a5b754e54277a566f484f29685f6f60'


def iter_xor(ptxt):
    ctxt = []
    for i, c in enumerate(ptxt):
        ctxt.append(i ^ c)
    return bytes(ctxt)


def verify_password(password):
    ptxt = password.encode()
    ctxt = iter_xor(ptxt)
    if ctxt == unhexlify(FLAG):
        return True
    else:
        return False


def main():
    password = input("Password: ")

    if verify_password(password):
        print("Congrats you found the password!")
    else:
        print("Try Hard!")


if __name__ == "__main__":
    main()
