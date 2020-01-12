#!/usr/bin/env python
# A wrapper around Cisco AnyConnect that simplifies using it in a terminal.

from __future__ import print_function
from subprocess import check_call, check_output, PIPE, Popen
import sys, tty

vpn = "/opt/cisco/anyconnect/bin/vpn"
tty.setcbreak(sys.stdin)
out = check_output([vpn, "status"])
if "state: Connected" in out:
    print("Press Enter to disconnect...")
    while True:
        key = ord(sys.stdin.read(1))
        if key == 10:
            check_call([vpn, "disconnect"])
            break
        if key == 27:
            break
        print("<{}>".format(key))
else:
    print("Enter key to connect: ", end="")
    ch = sys.stdin.read(1)
    if ord(ch) == 27:
        print()
    else:
        key = ''
        while ord(ch) != 10:
            print(ch, end="")
            key += ch
            ch = sys.stdin.read(1)
        p = Popen([vpn, "-s", "connect", "Americas West"], stdin=PIPE)
        p.stdin.write(key)
        p.communicate()
