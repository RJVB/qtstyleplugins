TEMPLATE = lib
load(qt_parts)

CONFIG += plugin c++11
QT += core widgets widgets-private core-private
greaterThan(QT_MAJOR_VERSION, 5)|greaterThan(QT_MINOR_VERSION, 7): \
    QT += theme_support-private
else: \
    QT += platformsupport-private

TARGET = kfusionstyle

HEADERS += \
        private/qstyleanimation_p.h \
        private/qstylehelper_p.h \
        private/qcommonstyle.h \
        private/qcommonstyle_p.h \
        private/qcommonstylepixmaps_p.h \
        private/qdrawhelper_p.h \
        private/qdrawingprimitive_sse2_p.h \
        private/qrgba64.h \
        private/qrgba64_p.h \
        private/qtcore-config.h \
        fusionstyle.json

SOURCES += \
        private/qstyleanimation.cpp \
        private/qstylehelper.cpp \
        private/qcommonstyle.cpp \
        private/qdrawhelper_ssse3.cpp \
        private/qdrawhelper_sse4.cpp

HEADERS += \
        names.h qfusionstyle_p.h qfusionstyle_p_p.h
SOURCES += \
        qfusionstyle.cpp \
        main.cpp

# RESOURCES += qstyle.qrc
DISTFILES += fusionstyle.json

PLUGIN_TYPE = styles
PLUGIN_CLASS_NAME = QFusionStylePlugin
load(qt_plugin)
