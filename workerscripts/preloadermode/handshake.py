import sys

from common import Device


def handshake(dev):
    dev.handshake()


if __name__ == "__main__":
    if len(sys.argv) > 1:
        dev = Device(sys.argv[1])
    else:
        dev = Device()
        dev.find_device()
    handshake(dev)
# Credit to xyz/k4y0z for original code from amonet-austin
# Modified a bit by mpax235 to remove unnecessary code/files
