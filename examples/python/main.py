import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl, QDir

# from dtk_qrc import *

app = QApplication([])
# QDir.setCurrent(app.applicationDirPath())
# QDir.setCurrent("E:/qpython/demo")

print ('cur',QDir.currentPath())
print ('appdir',app.applicationDirPath())

# view = QQuickView()
engine = QQmlApplicationEngine(app)
engine.addImportPath(QDir.currentPath())
engine.addImportPath(':/')
print(engine.importPathList())
engine.rootContext().setContextProperty('smallRadius',8)
engine.rootContext().setContextProperty('bigRadius',18)
url = QUrl("main.qml")

engine.load(url)
# engine.show()

sys.exit(app.exec_())