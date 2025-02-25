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
import sys
import time
import serial
import glob

BAUD = 115200
META_MODE_COMMAND = b"fastboot oem factory" # useless

def serial_ports():
    """ Lists available serial ports

    :raises EnvironmentError:
        On unsupported or unknown platforms
    :returns:
        A set containing the serial ports available on the system
    """
    if sys.platform.startswith("win"):
        # This covers Cygwin on Windows
        ports = [ "/dev/ttyS{0:d}".format(i + 1) for i in range(256) ] + [ "COM{0:d}".format(i + 1) for i in range(256) ]
    elif sys.platform.startswith("linux"):
        ports = glob.glob("/dev/ttyACM*")
    elif sys.platform.startswith("darwin"):
        ports = glob.glob("/dev/cu.usbmodem*")
    elif sys.platform.startswith("cygwin"):
        # This covers Cygwin on Windows
        ports = [ "/dev/ttyS{0:d}".format(i + 1) for i in range(256) ] + [ "COM{0:d}".format(i + 1) for i in range(256) ]
    else:
        raise EnvironmentError("Unsupported platform")

    result = set()
    for port in ports:
        try:
            s = serial.Serial(port)
            s.close()
            result.add(port)
        except (OSError, serial.SerialException):
            pass

    return result

def boot_into_meta_mode(port):
    ser = serial.Serial(port, BAUD)
    ser.write(META_MODE_COMMAND)
    ser.close()

if __name__ == "__main__":
    port = None

    print("Please plug the USB back in.")

    # Detect preloader port
    old = serial_ports()
    while True:
        new = serial_ports()

        # Port added
        if new > old:
            port = (new - old).pop()
            break
        # Port removed
        elif old > new:
            old = new

        time.sleep(0.25)

    print("Found port =", port)

    # Boot into meta mode
    print("Booting into Meta Mode...")
    print("** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **")
    with serial.Serial(port, BAUD) as dev:
        dev.write(b'METAMETA') # Write command to Preloader

    print ("You should now boot into Meta Mode.")
