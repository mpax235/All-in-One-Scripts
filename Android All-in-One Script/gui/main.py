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
from PyQt6.QtGui import QFontDatabase, QIcon
from PyQt6.QtWidgets import QApplication

#####################
# IMPORTS
#####################
from components.MainWindow import MainWindow

#####################
# PYTHON IMPORTS
#####################
import sys
import os

if __name__ == "__main__":
    app = QApplication(sys.argv)

    with open("styles/main.qss", "r") as file:
        app.setStyleSheet(file.read())

    montserrat_font = QFontDatabase.addApplicationFont("fonts/montserrat/Montserrat-Light.ttf")
    
    font_families = QFontDatabase.applicationFontFamilies(montserrat_font)

    app.setApplicationName("AndroidAllInOneScript")
    
    window = MainWindow()
    app.exec()