add_definitions(-DQT_PLUGIN)

set(qgtk3style_SRCS
    qgtk3painter.cpp
    qgtkpainter.cpp
    qgtkstyle.cpp
    qgtkstyle_p.cpp
    plugin.cpp)

#NB: we're still building against GTk2 in preparation for the conversion!
message(WARNING "This is NOT yet GTk3 based and currently doesn't even build yet!")
add_definitions(-DQT_NO_ANIMATION ${GTK2_DEFINITIONS})
add_definitions(-DGTK_DISABLE_SINGLE_INCLUDES -DGDK_DISABLE_DEPRECATED -DGTK_DISABLE_DEPRECATED)
set_source_files_properties(plugin.cpp OBJECT_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/gtk3.json)

add_library(qgtk3style SHARED ${qgtk3style_SRCS})

target_include_directories(qgtk3style PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../../..
    ${Qt5Core_PRIVATE_INCLUDE_DIRS}
    ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
    ${GTK2_INCLUDE_DIRS}
    ${X11_INCLUDE_DIR}
)

target_link_libraries(qgtk3style PRIVATE
    Styles::Private
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets
    ${GTK2_LIBRARIES}
    ${X11_LIBRARIES})
if(ENABLE_KDE)
    target_link_libraries(qgtk3style PRIVATE
        KF5::Style)
endif()
    

install(TARGETS qgtk3style DESTINATION ${KDE_INSTALL_QTPLUGINDIR}/styles)
