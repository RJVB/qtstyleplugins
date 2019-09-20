cmake_minimum_required(VERSION 3.5)

project(KFusion)

option(ENABLE_KDE
        "Add KDE support (the KFusion style will inherit KStyle)?"
        OFF)
option(USE_PRIVATE_KSTYLE
        "Use a private copy of the KStyle class"
        ON)

find_package(ECM 5.60.0  NO_MODULE)


set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_SOURCE_DIR}/cmake)


include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDEFrameworkCompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

set_package_properties(ECM PROPERTIES TYPE REQUIRED DESCRIPTION "Extra CMake Modules." URL "https://projects.kde.org/projects/kdesupport/extra-cmake-modules")

add_feature_info("Add KDE support (the KFusion style will inherit KStyle)" ENABLE_KDE "")
add_feature_info("Use a private copy of the KStyle class (required as long as KStyle isn't updated)" USE_PRIVATE_KSTYLE "")

set(QT_MIN_VERSION 5.9.0)

include(FindQt5Components)

execute_process(COMMAND cmake/git_version.sh
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  OUTPUT_VARIABLE KF5_VERSION
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
message(STATUS "KF5_VERSION=${KF5_VERSION}")

string(REPLACE "-fapplication-extension" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
string(REPLACE "-Wzero-as-null-pointer-constant" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

remove_definitions(-DQT_NO_SIGNALS_SLOTS_KEYWORDS -DQT_NO_CAST_FROM_ASCII)

if(ENABLE_KDE)
    set(KF5_DEP_VERSION "5.60.0") # handled by release scripts

    include(ECMSetupVersion)
    ecm_setup_version(${KF5_VERSION} VARIABLE_PREFIX KFUSION
                      VERSION_HEADER "${CMAKE_CURRENT_BINARY_DIR}/kfusion_version.h"
                      PACKAGE_VERSION_FILE "${CMAKE_CURRENT_BINARY_DIR}/KFusionConfigVersion.cmake"
                      SOVERSION 5)

    if (NOT USE_PRIVATE_KSTYLE)
        find_package(KF5 ${KF5_DEP_VERSION} REQUIRED COMPONENTS FrameworkIntegration)
    else()
        add_subdirectory(frameworkintegration)
    endif()
    add_definitions(-DTRANSLATION_DOMAIN=\"kfusion\"
                    -DENABLE_KDE)
    if (IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/po")
        ki18n_install(po)
    endif()
endif()

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


feature_summary(WHAT ALL   FATAL_ON_MISSING_REQUIRED_PACKAGES)
