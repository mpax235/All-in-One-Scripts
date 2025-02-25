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
from PyQt6.QtGui import QPixmap, QPainter, QColor
from PyQt6.QtWidgets import QWidget, QLabel, QPushButton, QHBoxLayout

class CustomTitleBar(QWidget):
    def __init__(self, parent=None):
        super(CustomTitleBar, self).__init__(parent)
        self.setFixedHeight(35)
        self.setStyleSheet("background-color: #000000; color: #00ffff;")

        self.favicon = QLabel(self)

        pixmap = QPixmap("images/icons/favicon.png").scaled(
            20, 15,
            Qt.AspectRatioMode.KeepAspectRatio,
            Qt.TransformationMode.FastTransformation
        )

        self.favicon.setPixmap(pixmap)

        self.title = QLabel("Android All-in-One Script (GUI)", self)
        self.title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.title.setStyleSheet("font-family: 'Montserrat'; margin-left: 10px;")

        self.minimize_button = QPushButton("_", self)
        self.minimize_button.setStyleSheet("QPushButton { background-color: #000000; font-family: 'Montserrat'; color: #00ffff; border: none; padding: 0px; margin-right: 10px; padding-bottom: 9px; font-size: 14px; } QPushButton:hover { background-color: #00ffff; color: #000000; }")
        self.minimize_button.setFixedWidth(30)
        self.minimize_button.setFixedHeight(20)
        self.minimize_button.clicked.connect(self.minimize_window)

        """
        self.maximize_button = QPushButton("🗖", self)
        self.maximize_button.setStyleSheet("QPushButton { background-color: #000000; font-family: 'Montserrat'; color: #00ffff; border: none; padding: 0px; margin-right: 10px; font-size: 14px; padding-bottom: 5px; } QPushButton:hover { background-color: #00ffff; color: #000000; }");
        self.maximize_button.setFixedWidth(30)
        self.maximize_button.setFixedHeight(20)
        self.maximize_button.clicked.connect(self.maximize_window)
        """

        self.close_button = QPushButton("X", self)
        self.close_button.setStyleSheet("QPushButton { background-color: #000000; font-family: 'Montserrat'; color: #00ffff; border: none; padding: 0px; margin-right: 10px; font-size: 14px; } QPushButton:hover { background-color: #00ffff; color: #000000; }")
        self.close_button.setFixedWidth(30)
        self.close_button.setFixedHeight(20)
        self.close_button.clicked.connect(self.close_window)

        layout = QHBoxLayout(self)
        layout.addWidget(self.favicon)
        layout.addWidget(self.title)
        layout.addStretch()
        layout.addWidget(self.minimize_button)
        # layout.addWidget(self.maximize_button)
        layout.addWidget(self.close_button)
        self.setLayout(layout)
    
    def close_window(self):
        self.window().close()
    
    def minimize_window(self):
        self.window().showMinimized()
    
    def maximize_window(self):
        if self.window().isMaximized():
            self.window().showNormal()
        else:
            self.window().showMaximized()
    
    def paintEvent(self, event):
        painter = QPainter(self)
        painter.fillRect(self.rect(), QColor("#000000"))
        super().paintEvent(event)
    
    def mousePressEvent(self, event):
        if event.button() == Qt.MouseButton.LeftButton:
            self.window().drag_position = event.globalPosition().toPoint() - self.window().frameGeometry().topLeft()
            event.accept()
    
    def mouseMoveEvent(self, event):
        if event.buttons() == Qt.MouseButton.LeftButton:
            self.window().move(event.globalPosition().toPoint() - self.window().drag_position)
            event.accept()