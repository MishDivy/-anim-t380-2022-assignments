
from PySide2 import QtCore, QtGui, QtWidgets
import os
import sys

if not os.path.normpath(os.getcwd()) in sys.path:
    sys.path.append(os.getcwd())

from main import create_from_gui

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(1203, 316)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.create_button = QtWidgets.QPushButton(
            self.centralwidget, clicked=lambda: self.create())
        self.create_button.setGeometry(QtCore.QRect(370, 200, 151, 41))
        font = QtGui.QFont()
        font.setPointSize(11)
        self.create_button.setFont(font)
        self.create_button.setObjectName("create_button")
        self.Function_Generator_label = QtWidgets.QLabel(self.centralwidget)
        self.Function_Generator_label.setGeometry(
            QtCore.QRect(290, 10, 300, 41))
        font = QtGui.QFont()
        font.setPointSize(12)
        self.Function_Generator_label.setFont(font)
        self.Function_Generator_label.setObjectName("Function_Generator_label")
        self.function_index_comboBox = QtWidgets.QComboBox(self.centralwidget)
        self.function_index_comboBox.setGeometry(
            QtCore.QRect(480, 90, 101, 22))
        self.function_index_comboBox.setObjectName("function_index_comboBox")
        self.function_index_comboBox.addItems(['0', '1', '2', '3'])
        self.Function_Index_label = QtWidgets.QLabel(self.centralwidget)
        self.Function_Index_label.setGeometry(QtCore.QRect(140, 90, 321, 31))
        font = QtGui.QFont()
        font.setPointSize(10)
        self.Function_Index_label.setFont(font)
        self.Function_Index_label.setObjectName("Function_Index_label")
        self.animation_index_comboBox = QtWidgets.QComboBox(self.centralwidget)
        self.animation_index_comboBox.setGeometry(
            QtCore.QRect(480, 130, 561, 22))
        self.animation_index_comboBox.setObjectName("animation_index_comboBox")
        self.animation_index_comboBox.addItems(["$MESH.translateY = $LOC.y + $AMP*sin($LOC.distance()*$FREQ+time*$SPEED)",
                                                "$MESH.translateY = $LOC.y + $AMP*sin($LOC.x*$FREQ+time*$SPEED)",
                                                "$MESH.translateY = $LOC.y + $AMP*sin($LOC.z*$FREQ+time*$SPEED)",
                                                "$MESH.translateY = $LOC.y + $AMP*sin($LOC.y*$FREQ+time*$SPEED)",
                                                "$MESH.translateY = $LOC.y + $AMP*sin(atan($LOC.y/($LOC.x+0.1))*$FREQ+time*$SPEED)"])
        self.Anim_Index_label = QtWidgets.QLabel(self.centralwidget)
        self.Anim_Index_label.setGeometry(QtCore.QRect(140, 130, 321, 31))
        font = QtGui.QFont()
        font.setPointSize(10)
        self.Anim_Index_label.setFont(font)
        self.Anim_Index_label.setObjectName("Anim_Index_label")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 801, 22))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def create(self):
        anim_index = self.animation_index_comboBox.currentIndex()
        func_index = self.function_index_comboBox.currentIndex()
        create_from_gui(func_index, anim_index)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.create_button.setText(_translate("MainWindow", "Create"))
        self.Function_Generator_label.setText(
            _translate("MainWindow", "Function Generator"))
        self.Function_Index_label.setText(
            _translate("MainWindow", "Function Index"))
        self.Anim_Index_label.setText(
            _translate("MainWindow", "Animation Index"))


if __name__ == "__main__":

    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
