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
# PYQT6 IMPORTS
#####################
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QFont
from PyQt6.QtWidgets import QDialog, QVBoxLayout, QHBoxLayout, QLabel, QPushButton, QMessageBox

#####################
# PYTHON IMPORTS
#####################
import subprocess

class BootOptionsDialog(QDialog):
    def __init__(self, parent=None):
        super(BootOptionsDialog, self).__init__(parent)

        self.resize(854, 480)
        self.setWindowTitle("Boot Menu")

        layout = QVBoxLayout()

        layout_adb = QHBoxLayout()

        label1 = QLabel("ADB Commands")
        label1.setFont(QFont("Montserrat", 14))
        label1.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout_adb.addWidget(label1)

        self.boot_to_os = QPushButton("Boot to Android", self)
        self.boot_to_os.clicked.connect(self.reboot_to_os)
        layout_adb.addWidget(self.boot_to_os)

        self.boot_to_recovery = QPushButton("Boot to Android Recovery")
        self.boot_to_recovery.clicked.connect(self.reboot_to_recovery)
        layout_adb.addWidget(self.boot_to_recovery)

        self.boot_to_fastboot1 = QPushButton("Boot to Android Fastboot")
        self.boot_to_fastboot1.clicked.connect(self.reboot_to_fastboot1)
        layout_adb.addWidget(self.boot_to_fastboot1)

        self.boot_to_fastboot2 = QPushButton("Boot to Fastboot / Odin")
        self.boot_to_fastboot2.clicked.connect(self.reboot_to_fastboot2)
        layout_adb.addWidget(self.boot_to_fastboot2)
        
        self.boot_to_fel = QPushButton("Boot to FEL Mode")
        self.boot_to_fel.clicked.connect(self.reboot_to_fel)
        layout_adb.addWidget(self.boot_to_fel)

        layout1 = QHBoxLayout()

        label2 = QLabel("Fastboot Commands")
        label2.setFont(QFont("Montserrat", 14))
        label2.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout1.addWidget(label2)

        self.boot_to_os2 = QPushButton("Boot to Android")
        self.boot_to_os2.clicked.connect(self.reboot_to_os2)
        layout1.addWidget(self.boot_to_os2)

        self.boot_to_fastboot1_2 = QPushButton("Boot to Android Fastboot")
        self.boot_to_fastboot1_2.clicked.connect(self.reboot_to_fastboot1_2)
        layout1.addWidget(self.boot_to_fastboot1_2)

        self.boot_to_fastboot2_2 = QPushButton("Boot to Fastboot / Odin")
        self.boot_to_fastboot2_2.clicked.connect(self.reboot_to_fastboot2_2)
        layout1.addWidget(self.boot_to_fastboot2_2)

        layout2 = QHBoxLayout()

        label3 = QLabel("Other Commands")
        label3.setFont(QFont("Montserrat", 14))
        label3.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout2.addWidget(label3)

        self.boot_to_meta = QPushButton("Boot to Meta Mode")
        self.boot_to_meta.clicked.connect(self.reboot_to_meta)
        layout2.addWidget(self.boot_to_meta)
        
        self.boot_to_factory = QPushButton("Boot to Factory Mode")
        self.boot_to_factory.clicked.connect(self.reboot_to_factory)
        layout2.addWidget(self.boot_to_factory)

        self.boot_to_preloader = QPushButton("Boot to Preloader Mode")
        self.boot_to_preloader.clicked.connect(self.reboot_to_preloader)
        layout2.addWidget(self.boot_to_preloader)

        self.boot_to_dl = QPushButton("Boot to Download Mode")
        self.boot_to_dl.clicked.connect(self.reboot_to_dl)
        layout2.addWidget(self.boot_to_dl)

        self.boot_to_advmeta = QPushButton("Boot to Advanced Meta Mode")
        self.boot_to_advmeta.clicked.connect(self.reboot_to_advmeta)
        layout2.addWidget(self.boot_to_advmeta)

        layout.addLayout(layout_adb)
        layout.addLayout(layout1)
        layout.addLayout(layout2)

        self.setLayout(layout)

        with open("styles/main.qss", "r") as file:
            self.setStyleSheet(file.read())
    
    ##############################
    #
    #  COMMANDS
    #
    ##############################

    # adb
    def reboot_to_os(self):
        try:
            subprocess.run(["adb", "reboot"], check=True)
            msg = QMessageBox(self)
            msg.setIcon(QMessageBox.Icon.Information)
            msg.setText("Your device should now be booting to Android.")
            msg.setWindowTitle("Rebooting to Android")
            msg.setStyleSheet("QLabel { font-family: Montserrat; }")
            msg.exec()
        except subprocess.CalledProcessError:
            msg = QMessageBox(self) 
            msg.setIcon(QMessageBox.Icon.Critical) 
            msg.setText("No devices were detected by the Script.\nPlease make sure that ADB is enabled on your device and that it is connected to this Computer.")
            msg.setWindowTitle("No devices detected") 
            msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
            msg.exec()
    
    def reboot_to_recovery(self):
        try:
            subprocess.run(["adb", "reboot", "recovery"], check=True)
            msg = QMessageBox(self)
            msg.setIcon(QMessageBox.Icon.Information)
            msg.setText("Your device should now be booting to Android Recovery.")
            msg.setWindowTitle("Rebooting to Android Recovery")
            msg.setStyleSheet("QLabel { font-family: Montserrat; }")
            msg.exec()
        except subprocess.CalledProcessError:
            msg = QMessageBox(self) 
            msg.setIcon(QMessageBox.Icon.Critical) 
            msg.setText("No devices were detected by the Script.\nPlease make sure that ADB is enabled on your device and that it is connected to this Computer.")
            msg.setWindowTitle("No devices detected") 
            msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
            msg.exec()

    def reboot_to_fastboot1(self):
        try:
            subprocess.run(["adb", "reboot", "fastboot"], check=True)
            msg = QMessageBox(self)
            msg.setIcon(QMessageBox.Icon.Information)
            msg.setText("Your device should now be booting to Android Fastboot.")
            msg.setWindowTitle("Rebooting to Android Fastboot")
            msg.setStyleSheet("QLabel { font-family: Montserrat; }")
            msg.exec()
        except subprocess.CalledProcessError:
            msg = QMessageBox(self) 
            msg.setIcon(QMessageBox.Icon.Critical) 
            msg.setText("No devices were detected by the Script.\nPlease make sure that ADB is enabled on your device and that it is connected to this Computer.")
            msg.setWindowTitle("No devices detected") 
            msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
            msg.exec()
    
    def reboot_to_fastboot2(self):
        try:
            subprocess.run(["adb", "reboot", "bootloader"], check=True)
            msg = QMessageBox(self) 
            msg.setIcon(QMessageBox.Icon.Information) 
            msg.setText("Your device should now be booting to Fastboot.")
            msg.setWindowTitle("Rebooting to Fastboot") 
            msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
            msg.exec()
        except subprocess.CalledProcessError:
            msg = QMessageBox(self) 
            msg.setIcon(QMessageBox.Icon.Critical) 
            msg.setText("No devices were detected by the Script.\nPlease make sure that ADB is enabled on your device and that it is connected to this Computer.")
            msg.setWindowTitle("No devices detected") 
            msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
            msg.exec()
    
    def reboot_to_fel(self):
        msgbox = QMessageBox(self)
        msgbox.setIcon(QMessageBox.Icon.Warning)
        msgbox.setText("This option is for AllWinner devices only. If your device is a AllWinner device, click yes. Otherwise click no.")
        msgbox.setWindowTitle("Are you sure?")
        msgbox.setStyleSheet("QLabel { font-family: Montserrat; }")
        msgbox.setStandardButtons(QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No)

        result = msgbox.exec()

        if result == QMessageBox.StandardButton.Yes:
            try:
                subprocess.run(["adb", "reboot", "fel"], check=True)
                msg = QMessageBox(self) 
                msg.setIcon(QMessageBox.Icon.Information) 
                msg.setText("Your device should now be booting to FEL mode.")
                msg.setWindowTitle("Rebooting to FEL mode") 
                msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
                msg.exec()
            except subprocess.CalledProcessError:
                msg = QMessageBox(self) 
                msg.setIcon(QMessageBox.Icon.Critical) 
                msg.setText("No devices were detected by the Script.\nPlease make sure that ADB is enabled on your device and that it is connected to this Computer.")
                msg.setWindowTitle("No devices detected") 
                msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
                msg.exec()
        elif result == QMessageBox.StandardButton.No:
            print("The device is not a AllWinner device.")

    # fastboot
    def reboot_to_os2(self):
        print("\n\nIf you are reading this, the application may freeze while Fastboot waits for a device. Please make sure to plug one in (in fastboot mode).\n\n")
        subprocess.run(["fastboot", "reboot"], check=True)
        QMessageBox.information(self, "Rebooting to Android", "Your device should now be booting to Android.")
    
    def reboot_to_fastboot1_2(self):
        print("\n\nIf you are reading this, the application may freeze while Fastboot waits for a device. Please make sure to plug one in (in fastboot mode).\n\n")
        subprocess.run(["fastboot", "reboot", "fastboot"], check=True)
        QMessageBox.information(self, "Rebooting to Android Fastboot", "Your device should now be booting to Android Fastboot.")
    
    def reboot_to_fastboot2_2(self):
        print("\n\nIf you are reading this, the application may freeze while Fastboot waits for a device. Please make sure to plug one in (in fastboot mode).\n\n")
        subprocess.run(["fastboot", "reboot", "bootloader"], check=True)
        QMessageBox.information(self, "Rebooting to Fastboot", "Your device should now be booting to Fastboot.")

    # other stuff
    def reboot_to_meta(self):
        msg = QMessageBox(self) 
        msg.setIcon(QMessageBox.Icon.Information) 
        msg.setText("Coming soon!")
        msg.setWindowTitle("Feature coming soon.") 
        msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
        msg.exec()
    
    def reboot_to_factory(self):
        msg = QMessageBox(self) 
        msg.setIcon(QMessageBox.Icon.Information) 
        msg.setText("Coming soon!")
        msg.setWindowTitle("Feature coming soon.") 
        msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
        msg.exec()

    def reboot_to_preloader(self):
        msg = QMessageBox(self) 
        msg.setIcon(QMessageBox.Icon.Information) 
        msg.setText("Coming soon!")
        msg.setWindowTitle("Feature coming soon.") 
        msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
        msg.exec()

    def reboot_to_dl(self):
        msg = QMessageBox(self) 
        msg.setIcon(QMessageBox.Icon.Information) 
        msg.setText("Coming soon!")
        msg.setWindowTitle("Feature coming soon.") 
        msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
        msg.exec()

    def reboot_to_advmeta(self):
        msg = QMessageBox(self) 
        msg.setIcon(QMessageBox.Icon.Information) 
        msg.setText("Coming soon!")
        msg.setWindowTitle("Feature coming soon.") 
        msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
        msg.exec()