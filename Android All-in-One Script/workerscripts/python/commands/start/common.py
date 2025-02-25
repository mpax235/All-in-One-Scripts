# MIT License
#
# Copyright (c) 2025 mpax235
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#####################
# PYTHON IMPORTS
#####################
import struct
import sys
import glob
import time
import serial

BAUD = 115200
TIMEOUT = 5




def serial_ports ():
    """ Lists available serial ports

        :raises EnvironmentError:
            On unsupported or unknown platforms
        :returns:
            A set containing the serial ports available on the system
    """

    if sys.platform.startswith("win"):
        ports = [ "COM{0:d}".format(i + 1) for i in range(256) ]
    elif sys.platform.startswith("linux"):
        ports = glob.glob("/dev/ttyACM*")
    elif sys.platform.startswith("darwin"):
        ports = glob.glob("/dev/cu.usbmodem*")
    else:
        raise EnvironmentError("Unsupported platform")

    result = set()
    for port in ports:
        try:
            s = serial.Serial(port, timeout=TIMEOUT)
            s.close()
            result.add(port)
        except (OSError, serial.SerialException):
            pass

    return result


def p32_be(x):
    return struct.pack(">I", x)


class Device:

    def __init__(self, port=None):
        self.dev = None
        if port:
            self.dev = serial.Serial(port, BAUD, timeout=TIMEOUT)

    def find_device(self,preloader=False):
        if self.dev:
            raise RuntimeError("Device already found")

        print("Please plug the USB back in but dont hold any buttons to enter Preloader mode.")
        print("If you are entering Download mode. Hold the button to enter Download mode and while holding plug in the USB. (Usually the Recovery Mode button)")

        old = serial_ports()
        while True:
            new = serial_ports()

            # port added
            if new > old:
                port = (new - old).pop()
                break
            # port removed
            elif old > new:
                old = new

            time.sleep(0.25)

        print("Download Mode/Preloader was found. To use the Download Mode/Preloader terminal, use it from the Boot Menu.")

        self.dev = serial.Serial(port, BAUD, timeout=TIMEOUT)

    def check(self, test, gold):
        if test != gold:
            raise RuntimeError("ERROR: Serial protocol mismatch")

    def check_int(self, test, gold):
        test = struct.unpack('>I', test)[0]
        self.check(test, gold)

    def _writeb(self, out_str):
        self.dev.write(out_str)
        return self.dev.read()

    def handshake(self):
        # look for start byte
        while True:
            c = self._writeb(b'\xa0')
            if c == b'\x5f':
                break
            self.dev.flushInput()

        # now do the start command sequence
        self.check(self._writeb(b'\x0a'), b'\xf5')
        self.check(self._writeb(b'\x50'), b'\xaf')
        self.check(self._writeb(b'\x05'), b'\xfa')
# Credit to xyz/k4y0z for original code from amonet-austin
# Modified a bit by mpax235 to remove unnecessary code/files
