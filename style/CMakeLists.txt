add_definitions(-DQT_PLUGIN)

set(kfusionstyle_SRCS
    private/qstyleanimation.cpp
    private/qstylehelper.cpp
    private/qcommonstyle.cpp
    qfusionstyle.cpp
    main.cpp)

set_source_files_properties(main.cpp OBJECT_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/fusionstyle.json)

add_library(kfusionstyle SHARED ${kfusionstyle_SRCS})

target_include_directories(kfusionstyle PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/private
    ${Qt5Core_PRIVATE_INCLUDE_DIRS}
    ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
)

target_link_libraries(kfusionstyle PRIVATE
    Qt5::Core
    Qt5::Widgets)
if(ENABLE_KDE)
    target_link_libraries(kfusionstyle PRIVATE
        KF5::Style)
endif()
    

install(TARGETS kfusionstyle DESTINATION ${KDE_INSTALL_QTPLUGINDIR}/styles)
