add_definitions(-DQT_PLUGIN)

set(qgtk2style_SRCS
    qgtk2painter.cpp
    qgtkpainter.cpp
    qgtkstyle.cpp
    qgtkstyle_p.cpp
    plugin.cpp)

add_definitions(-DQT_NO_ANIMATION ${GTK2_DEFINITIONS})
set_source_files_properties(plugin.cpp OBJECT_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/gtk2.json)

add_library(qgtk2style SHARED ${qgtk2style_SRCS})

target_include_directories(qgtk2style PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../../..
    ${Qt5Core_PRIVATE_INCLUDE_DIRS}
    ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
    ${GTK2_INCLUDE_DIRS}
    ${X11_INCLUDE_DIR}
)

target_link_libraries(qgtk2style PRIVATE
    Styles::Private
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets
    ${GTK2_LIBRARIES}
    ${X11_LIBRARIES})
if(ENABLE_KDE)
    target_link_libraries(qgtk2style PRIVATE
        KF5::Style)
endif()
    

install(TARGETS qgtk2style DESTINATION ${KDE_INSTALL_QTPLUGINDIR}/styles)
