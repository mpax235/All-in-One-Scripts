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

echo -e "This will setup the All-in-One Scripts for use."
echo -e "This will also disable SELinux temporarily to make sure nothing goes wrong, and then re-enable it after."
echo -e "SELinux disabling does not happen if SELinux is entirely disabled."
echo
read -p "Press any key to continue... " setup

# install SELinux packages in order to disable SELinux
sudo apt install selinux-utils

# disable SElinux temporarily
sudo setenforce 0

# install the bare packages
sudo apt install python3 python3-serial adb fastboot

# do the fun stuff like making all .sh files usable without the "Permission denied" errors
cd "Android All-in-One Script"
sudo chmod +x ./main.sh
cd workerscripts
cd linux
sudo chmod +x ./bootmenu.sh
sudo chmod +x ./devicemenu.sh
sudo chmod +x ./dumpmenu.sh
sudo chmod +x ./unlock_alt.sh
cd ..
cd python
cd commands
cd start
sudo chmod +x ./prepare.sh
cd ../../../../..

# ask user if they want to install mtkclient
read -p "Do you want to install mtkclient to finish the installation? (1 for yes, 0 for no)" mtkclient

if [ "$mtkclient" == "1" ]; then
    echo -e "Coming soon!"
fi

# reenable SElinux
sudo setenforce 1
