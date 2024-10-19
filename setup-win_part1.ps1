echo "This will setup the All-in-One Scripts for use."
echo ""
pause

# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# tell user to install python from microsoft store
echo "To continue this setup, you will need to install Python at the Microsoft Store."
echo "Press the Enter key to launch the Microsoft Store."
echo ""
pause
echo "Starting Microsoft Store in 5 seconds, press the 'Get' button on the Python page..."
echo "After you have done so, after closing Microsoft Store, press Enter to continue the setup."
sleep 5
Start-Process "ms-windows-store://pdp/?productid=9pnrbtzxmb4z"
echo ""
echo "If you came back here, the script will assume you have Python installed, please make sure you have it installed"
echo "and then press Enter to continue."
pause

# tell user to set python in system path
echo "Now put Python in System PATH by doing the following steps:"
echo "Press the Windows key and then search for 'System Path' and then click on 'Edit the system environment variables'"
echo "After that press N or click on 'Environment Variables' then click on 'PATH' (create one if it does not exist) and then click 'Edit'"
echo "Now click 'Browse' and then naviagte to the Drive letter you have Windows on and then navigate to 'Program Files' and search for keywords 'Python',"
echo "if found, click on the Folder containing the keyword 'Python' and then click 'OK' and then again with the other 3 prompts."
echo ""
echo "Once you done it the Script will open a new Powershell terminal and exit the old one."
echo "To continue setup, please run 'setup-win_part2.ps1'."
echo ""
pause
Start-Process powershell -Verb RunAs
exit
exit
