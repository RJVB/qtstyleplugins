add_definitions(-DQT_PLUGIN)

set(qcleanlooksstyle_SRCS
    qcleanlooksstyle.cpp
    plugin.cpp)

set_source_files_properties(plugin.cpp OBJECT_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/cleanlooks.json)

add_library(qcleanlooksstyle SHARED ${qcleanlooksstyle_SRCS})

target_include_directories(qcleanlooksstyle PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../../..
    ${Qt5Core_PRIVATE_INCLUDE_DIRS}
    ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
)

target_link_libraries(qcleanlooksstyle PRIVATE
    Styles::Private
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets)
# if(ENABLE_KDE)
#     target_link_libraries(qcleanlooksstyle PRIVATE
#         KF5::Style)
# endif()
    

install(TARGETS qcleanlooksstyle DESTINATION ${KDE_INSTALL_QTPLUGINDIR}/styles)
