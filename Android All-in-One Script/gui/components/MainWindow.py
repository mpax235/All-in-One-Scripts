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
from PyQt6.QtCore import Qt, QRect, QUrl
from PyQt6.QtGui import QIcon, QAction, QFont, QPixmap, QPainter, QDesktopServices
from PyQt6.QtWidgets import QMainWindow, QToolBar, QWidget, QVBoxLayout, QLabel, QHBoxLayout, QMessageBox

#####################
# IMPORTS
#####################
from components.CustomTitleBar import CustomTitleBar
from components.BootOptionsDialog import BootOptionsDialog
from components.DumpOptionsDialog import DumpOptionsDialog

# UTILS
from utils.resource_path import resource_path

class MainWindow(QMainWindow):
    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)
        self.setObjectName("MainWindow")

        self.resize(854, 480)
        self.setFixedSize(854, 480)
        self.setWindowTitle("Android All-in-One Script (GUI)")

        try:
            icon_path = resource_path("images/icons/favicon.png")
            self.setWindowIcon(QIcon(icon_path))
        except Exception as e:
            print(f"Error loading icon: {e}")

        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)

        self.title_bar = CustomTitleBar(self)
        self.setMenuWidget(self.title_bar)

        self.navtb = QToolBar("Navigation")
        self.navtb.setMovable(False)
        self.addToolBar(self.navtb)

        boot_options = QAction("Boot Menu", self)
        boot_options.setFont(QFont("Montserrat", 8))
        boot_options.triggered.connect(self.show_boot_options)
        self.navtb.addAction(boot_options)

        dump_menu = QAction("Dump Menu", self)
        dump_menu.triggered.connect(self.show_dump_options)
        dump_menu.setFont(QFont("Montserrat", 8))
        self.navtb.addAction(dump_menu)

        device_menu = QAction("Device Menu", self)
        device_menu.triggered.connect(self.show_device_menu)
        device_menu.setFont(QFont("Montserrat", 8))
        self.navtb.addAction(device_menu) 

        self.navtb.setStyleSheet("""
            QToolBar { color: #00ffff; }
            QToolBar QToolButton::menu_indicator { image: none; }
            QToolBar QToolButton { color: #00ffff; }
        """)   

        central_widget = QWidget(self)
        self.setCentralWidget(central_widget)

        v_layout = QVBoxLayout(central_widget)

        label = QLabel("Welcome to Android All-in-One Script!", self)
        label.setFont(QFont("Montserrat", 20))

        label1 = QLabel("I've first created this project as \"Fire All-in-One Script\" on July 14th, 2024. Since then, it moved on to include a another script and became \"Android All-in-One Script\".", self)
        label1.setFont(QFont("Montserrat", 11))
        label1.setFixedWidth(500)
        label1.setWordWrap(True)
        label1.setAlignment(Qt.AlignmentFlag.AlignCenter)

        label2 = QLabel("Made by mpax235. This program is open-source.", self)
        label2.setFont(QFont("Montserrat", 11))
        label2.setStyleSheet("""
            QLabel { margin-top: 20px; }
        """)
        label2.setFixedWidth(500)
        label2.setWordWrap(True)
        label2.setAlignment(Qt.AlignmentFlag.AlignCenter)

        h_layout = QHBoxLayout()
        h_layout.addStretch()
        h_layout.addWidget(label)
        h_layout.addStretch()

        i_layout = QHBoxLayout()
        i_layout.addStretch()
        i_layout.addWidget(label1)
        i_layout.addStretch()

        i_layout2 = QHBoxLayout()
        i_layout2.addStretch()
        i_layout2.addWidget(label2)
        i_layout2.addStretch()

        v_layout.addLayout(h_layout)
        v_layout.addLayout(i_layout)
        v_layout.addLayout(i_layout2)
        v_layout.addStretch()

        self.image_label = QLabel(self)
        self.logo_pixmap = QPixmap("images/logo.png")

        self.resized_logo = self.logo_pixmap.scaled(int(126.4), int(31.9333333333), Qt.AspectRatioMode.KeepAspectRatio)
        self.image_label.setPixmap(self.resized_logo)

        self.image_label.setAlignment(Qt.AlignmentFlag.AlignBottom | Qt.AlignmentFlag.AlignRight)

        self.image_label.setGeometry(self.width() - self.logo_pixmap.width(), self.height() - self.logo_pixmap.height(), self.logo_pixmap.width(), self.logo_pixmap.height())

        self.github_icon = QLabel(self)
        self.github_pixmap = QPixmap("images/icons/github.png")

        self.resized_github = self.github_pixmap.scaled(int(31.9333333333), int(31.9333333333), Qt.AspectRatioMode.KeepAspectRatio)
        self.github_icon.setPixmap(self.resized_github)

        self.github_icon.setAlignment(Qt.AlignmentFlag.AlignBottom | Qt.AlignmentFlag.AlignLeft)

        self.github_icon.setGeometry(self.width() - self.github_pixmap.width(), self.height() - self.github_pixmap.height(), self.github_pixmap.width(), self.github_pixmap.height())

        self.github_icon.setCursor(Qt.CursorShape.PointingHandCursor)
        self.github_icon.mousePressEvent = self.open_github

        self.image_label.setCursor(Qt.CursorShape.PointingHandCursor)
        self.image_label.mousePressEvent = self.open_mpax235

        self.update_image_position()

        self.show()

        # self.installEventFilter(self)
    
    def show_boot_options(self):
        dialog = BootOptionsDialog(self)
        dialog.exec()
    
    def show_dump_options(self):
        dialog = DumpOptionsDialog(self)
        dialog.exec()
    
    def show_device_menu(self):
        msg = QMessageBox(self) 
        msg.setIcon(QMessageBox.Icon.Information) 
        msg.setText("Coming soon!")
        msg.setWindowTitle("Feature coming soon.") 
        msg.setStyleSheet("QLabel { font-family: Montserrat; }") 
        msg.exec()
    
    def open_github(self, event):
        QDesktopServices.openUrl(QUrl("https://github.com/mpax235/All-in-One-Scripts/tree/main/Android%20All-in-One%20Script"))
    
    def open_mpax235(self, event):
        QDesktopServices.openUrl(QUrl("https://mpax235.github.io"))
    
    def resizeEvent(self, event):
        super().resizeEvent(event)
        self.update_image_position()
    
    def update_image_position(self):
        padding_right = 20
        padding_bottom = 20
        padding_leftgithub = 20
        self.image_label.setGeometry(
            self.width() - self.resized_logo.width() - padding_right,
            self.height() - self.resized_logo.height() - padding_bottom,
            self.resized_logo.width(),
            self.resized_logo.height()
        )

        self.github_icon.setGeometry(
            padding_leftgithub,
            self.height() - self.resized_github.height() - padding_bottom,
            self.resized_github.width(),
            self.resized_github.height()
        )
    
    def paintEvent(self, event):
        painter = QPainter(self)
        pixmap = QPixmap("images/websitebackground.png")
        
        window_rect = self.rect()
        target_height = window_rect.height()
        target_width = int(target_height * (16 / 9))

        if target_width > window_rect.width():
            target_width = window_rect.width()
            target_height = int(target_width * (9 / 16))
        
        scaled_pixmap = pixmap.scaled(target_width, target_height, Qt.AspectRatioMode.KeepAspectRatioByExpanding, Qt.TransformationMode.SmoothTransformation)

        x_offset = (window_rect.width() - scaled_pixmap.width()) // 2
        y_offset = (window_rect.height() - scaled_pixmap.height()) // 2
        target_rect = QRect(x_offset, y_offset, scaled_pixmap.width(), scaled_pixmap.height())

        painter.drawPixmap(target_rect, scaled_pixmap)
    
    """
    def eventFilter(self, obj, event):
        if obj == self and event.type() == QEvent.Type.MouseMove:
            mouse_position = event.globalPosition().toPoint()
            rect = self.rect()
            cursor = Qt.CursorShape.ArrowCursor

            if mouse_position.x() > rect.right() - 10:
                cursor = Qt.CursorShape.SizeHorCursor
            elif mouse_position.x() < rect.left() + 10:
                cursor = Qt.CursorShape.SizeHorCursor
            elif mouse_position.y() > rect.bottom() - 10:
                cursor = Qt.CursorShape.SizeVerCursor
            elif mouse_position.y() < rect.top() + 10:
                cursor = Qt.CursorShape.SizeVerCursor
            
            self.setCursor(cursor)

            if event.buttons() == Qt.MouseButton.LeftButton:
                new_size = self.size()

                if cursor == Qt.CursorShape.SizeHorCursor:
                    new_size.setWidth(mouse_position.x() - self.x())
                elif cursor == Qt.CursorShape.SizeVerCursor:
                    new_size.setHeight(mouse_position.y() - self.y())
                
                self.resize(new_size)
                event.accept()
        
        return super().eventFilter(obj, event)
    """