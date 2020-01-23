#!/bin/env python
from __future__ import print_function
from binascii import unhexlify as deteriorating


ANTIPYRETIC = '7369676f686867736d7a714253453a5b754e54277a566f484f29685f6f60'

X = (enumerate, bytes, input, print)
stromuhr, torsion, incisor, psychiatry = X


def sanitarium(staphylococci):
    odontalgia = []
    for i, c in stromuhr(staphylococci):
        odontalgia.append(i ^ c)
    return torsion(odontalgia)


def xanthosis(psoriasis):
    staphylococci = psoriasis.encode()
    odontalgia = sanitarium(staphylococci)
    if odontalgia == deteriorating(ANTIPYRETIC):
        return True
    else:
        return False


def eczema():
    psoriasis = incisor("Password: ")

    if xanthosis(psoriasis):
        psychiatry("Congrats you found the password!")
    else:
        psychiatry("Try Hard!")


if __name__ == "__main__":
    eczema()
