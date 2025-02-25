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

class DumpOptionsDialog(QDialog):
    def __init__(self, parent=None):
        super(DumpOptionsDialog, self).__init__(parent)

        self.resize(854, 480)
        self.setWindowTitle("Dump Menu")

        layout = QVBoxLayout()

        layout_hardware = QHBoxLayout()

        label1 = QLabel("MediaTek Stuff")
        label1.setFont(QFont("Montserrat", 14))
        label1.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout_hardware.addWidget(label1)

        self.dumpbromtk = QPushButton("Dump BootROM", self)
        self.dumpbromtk.clicked.connect(self.dumpmtkbrom)
        layout_hardware.addWidget(self.dumpbromtk)

        layout_software = QHBoxLayout()

        label2 = QLabel("System Stuff")
        label2.setFont(QFont("Montserrat", 14))
        label2.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout_software.addWidget(label2)

        self.dump_bootanimation = QPushButton("Dump bootanimation.zip", self)
        self.dump_bootanimation.clicked.connect(self.dump_bootanimationcommand)
        layout_software.addWidget(self.dump_bootanimation)

        layout.addLayout(layout_hardware)
        layout.addLayout(layout_software)

        self.setLayout(layout)

        with open("styles/main.qss", "r") as file:
            self.setStyleSheet(file.read())
    
    ##############################
    #
    #  COMMANDS
    #
    ##############################

    # adb
    def dumpmtkbrom(self):
        msg = QMessageBox(self) 
        msg.setIcon(QMessageBox.Icon.Information) 
        msg.setText("Coming soon!")
        msg.setWindowTitle("Feature coming soon.") 
        msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
        msg.exec()

    def dump_bootanimationcommand(self):
        try:
            subprocess.run(["adb", "pull", "/system/media/bootanimation.zip", "%USERPROFILE%/Downloads/bootanimation.zip"], check=True, shell=True)
            msg = QMessageBox(self)
            msg.setIcon(QMessageBox.Icon.Information)
            msg.setText("The bootanimation.zip file should be found in %USERPROFILE%\/Downloads\/Abootanimation.zip")
            msg.setWindowTitle("bootanimation.zip has been dumped")
            msg.setStyleSheet("QLabel { font-family: Montserrat; }")
            msg.exec()
        except subprocess.CalledProcessError:
            msg = QMessageBox(self) 
            msg.setIcon(QMessageBox.Icon.Critical) 
            msg.setText("No devices were detected by the Script.\nPlease make sure that ADB is enabled on your device and that it is connected to this Computer.")
            msg.setWindowTitle("No devices detected") 
            msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
            msg.exec()