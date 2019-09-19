### KFusion

This is the Qt5 Fusion widget style, broken out from the Qt 5.12 branch at commit v5.12.5-27-g52ad1de1f6 and made stand-alone.

It builds against Qt 5.9.8 and up (tested with 5.9.8 and 5.12.4).

It will register as KFusion but also as Fusion, so that it replaces the built-in Fusion style in Qt builds where this style was disabled.

Evolutions to follow:
- add support for building via CMake
- make the style respect the icons-in-buttons setting
- optionally inherit KStyle from the KF5 plasma-framework

