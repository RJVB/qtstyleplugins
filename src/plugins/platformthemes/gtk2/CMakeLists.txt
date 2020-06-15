add_definitions(-DQT_PLUGIN)

set(qgtk2_SRCS
    main.cpp
    qgtk2dialoghelpers.cpp
    qgtk2theme.cpp)

add_definitions(-DQT_NO_ANIMATION ${GTK2_DEFINITIONS})
set_source_files_properties(main.cpp OBJECT_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/gtk2.json)

add_library(qgtk2 SHARED ${qgtk2_SRCS})

target_include_directories(qgtk2 PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../../..
    ${Qt5Core_PRIVATE_INCLUDE_DIRS}
    ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
    ${GTK2_INCLUDE_DIRS}
    ${X11_INCLUDE_DIR}
)

target_link_libraries(qgtk2 PRIVATE
    Styles::Private
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets
    Qt5::DBus
    Qt5ThemeSupport::Qt5ThemeSupport
    ${GTK2_LIBRARIES}
    ${X11_LIBRARIES})
    

install(TARGETS qgtk2 DESTINATION ${KDE_INSTALL_QTPLUGINDIR}/platformthemes)
