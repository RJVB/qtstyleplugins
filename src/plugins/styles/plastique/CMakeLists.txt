add_definitions(-DQT_PLUGIN)

set(qplastiquestyle_SRCS
    qplastiquestyle.cpp
    plugin.cpp)

set_source_files_properties(plugin.cpp OBJECT_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/plastique.json)

add_library(qplastiquestyle SHARED ${qplastiquestyle_SRCS})

target_include_directories(qplastiquestyle PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../../..
    ${Qt5Core_PRIVATE_INCLUDE_DIRS}
    ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
)

target_link_libraries(qplastiquestyle PRIVATE
    Styles::Private
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets)
# if(ENABLE_KDE)
#     target_link_libraries(qplastiquestyle PRIVATE
#         KF5::Style)
# endif()
    

install(TARGETS qplastiquestyle DESTINATION ${KDE_INSTALL_QTPLUGINDIR}/styles)
