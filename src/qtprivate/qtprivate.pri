INCLUDEPATH += $$PWD
# allow depends to use "qtprivate/foo.h"
INCLUDEPATH += $$PWD/../
DEPENDPATH += $$PWD

HEADERS += \
    $$PWD/qhexstring_p.h \
    $$PWD/qstyle_p.h \
    $$PWD/qstylehelper_p.h

SOURCES += \
    $$PWD/qstylehelper.cpp
