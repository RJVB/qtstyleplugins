TARGET  = qgtk2style
PLUGIN_TYPE = styles
PLUGIN_CLASS_NAME = QGtk2StylePlugin
load(qt_plugin)

QT = core-private gui-private widgets-private

CONFIG += link_pkgconfig
PKGCONFIG += gtk+-2.0 x11

HEADERS += qgtk2painter_p.h qgtkglobal_p.h qgtkpainter_p.h qgtkstyle_p.h qgtkstyle_p_p.h
SOURCES += qgtk2painter.cpp qgtkpainter.cpp qgtkstyle.cpp qgtkstyle_p.cpp plugin.cpp
DEFINES += QT_NO_ANIMATION

include(../../../qtprivate/qtprivate.pri)

OTHER_FILES += gtk2.json
