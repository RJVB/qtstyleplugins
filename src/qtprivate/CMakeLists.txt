set(private_SRCS
    qstyleanimation.cpp
    qstylehelper.cpp
    qcommonstyle.cpp
    qdrawhelper_ssse3.cpp
    qdrawhelper_sse4.cpp
    qfontmetrics.cpp
    qsidebar.cpp)

add_library(private STATIC ${private_SRCS})
target_include_directories(private PRIVATE
    ${Qt5Core_PRIVATE_INCLUDE_DIRS}
    ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
)
target_link_libraries(private PRIVATE
    Qt5::Core
    Qt5::Widgets)
add_library(Styles::Private ALIAS private)
