TARGET  = qplastiquestyle
PLUGIN_TYPE = styles
PLUGIN_CLASS_NAME = QPlastiqueStylePlugin
load(qt_plugin)

QT = core core-private gui gui-private widgets

HEADERS += qplastiquestyle.h
SOURCES += qplastiquestyle.cpp
SOURCES += plugin.cpp

include(../../../qtprivate/qtprivate.pri)

OTHER_FILES += plastique.json
