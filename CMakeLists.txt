cmake_minimum_required(VERSION 3.5)

project(QtStylePlugins)

include(FeatureSummary)

option(ENABLE_CLEANLOOKS "Build the cleanlooks style" ON)
option(ENABLE_GTK2 "Build the GTk2 style that uses GTk2 and your GTk2 theme to render Qt widgets" ON)
option(ENABLE_KFUSION "Build the KFusion style (a tweaked version of Qt's built-in Fusion style)" ON)
option(ENABLE_PLASTIQUE "Build the plastique style" ON)

option(ENABLE_KDE
        "Add KDE support (the KFusion style will inherit KStyle)?"
        OFF)
add_feature_info("Add KDE support (the GTk2 and KFusion styles will inherit KStyle)" ENABLE_KDE "")
if(ENABLE_KDE)
    option(USE_PRIVATE_KSTYLE
        "Use a private copy of the KStyle class"
        ON)
    add_feature_info("Use a private copy of the KStyle class (required as long as KStyle isn't updated)" USE_PRIVATE_KSTYLE "")
endif()

find_package(ECM 5.60.0  NO_MODULE)


set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_SOURCE_DIR}/cmake)


include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDEFrameworkCompilerSettings NO_POLICY_SCOPE)

set_package_properties(ECM PROPERTIES TYPE REQUIRED DESCRIPTION "Extra CMake Modules." URL "https://projects.kde.org/projects/kdesupport/extra-cmake-modules")

set(REQUIRED_QT_VERSION 5.8.0)
# for the use of Q_FALLTHROUGH
set(CMAKE_CXX_STANDARD 17)

include(FindQt5Components)

if(ENABLE_GTK2)
    if ((NOT APPLE OR APPLE_FORCE_X11))
        find_package(X11)
    endif()
    find_package(GTK2 COMPONENTS gtk)
endif()

execute_process(COMMAND cmake/git_version.sh
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  OUTPUT_VARIABLE KF5_VERSION
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
message(STATUS "KF5_VERSION=${KF5_VERSION}")

string(REPLACE "-fapplication-extension" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
string(REPLACE "-Wzero-as-null-pointer-constant" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
string(REPLACE "-Wdate-time" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

remove_definitions(-DQT_NO_SIGNALS_SLOTS_KEYWORDS -DQT_NO_CAST_FROM_ASCII -DQT_NO_CAST_FROM_BYTEARRAY)

if(ENABLE_KDE)
    set(KF5_DEP_VERSION "5.60.0") # handled by release scripts

    include(ECMSetupVersion)
    ecm_setup_version(${KF5_VERSION} VARIABLE_PREFIX KFUSION
                      VERSION_HEADER "${CMAKE_CURRENT_BINARY_DIR}/kfusion_version.h"
                      PACKAGE_VERSION_FILE "${CMAKE_CURRENT_BINARY_DIR}/KFusionConfigVersion.cmake"
                      SOVERSION 5)

    if (NOT USE_PRIVATE_KSTYLE)
        find_package(KF5 ${KF5_DEP_VERSION} REQUIRED COMPONENTS FrameworkIntegration)
    endif()
    add_definitions(-DTRANSLATION_DOMAIN=\"kfusion\"
                    -DENABLE_KDE)
    if (IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/po")
        ki18n_install(po)
    endif()
endif()

add_subdirectory(src)

feature_summary(WHAT ALL   FATAL_ON_MISSING_REQUIRED_PACKAGES)
