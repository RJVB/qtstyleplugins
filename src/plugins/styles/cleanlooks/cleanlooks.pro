TARGET  = qcleanlooksstyle
PLUGIN_TYPE = styles
PLUGIN_CLASS_NAME = QCleanlooksStylePlugin
load(qt_plugin)

QT = core gui widgets

HEADERS += qcleanlooksstyle.h
SOURCES += qcleanlooksstyle.cpp
SOURCES += plugin.cpp

include(../../../qtprivate/qtprivate.pri)

OTHER_FILES += cleanlooks.json
