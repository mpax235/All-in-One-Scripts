import struct

from common import Device
from handshake import handshake

def main():
    dev = Device()
    dev.find_device()

    handshake(dev)

if __name__ == "__main__":
    main()

# Credit to xyz/k4y0z for original code from amonet-austin
# Modified a bit by mpax235 to remove unnecessary code/files
