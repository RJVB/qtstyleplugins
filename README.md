### KFusion

This is the Qt5 Fusion widget style, broken out from the Qt 5.12 branch at commit v5.12.5-27-g52ad1de1f6 and made stand-alone.
In addition it can (optionally) be built against an adapted version of the KStyle class from the KF5 FrameworkIntegration library.
This improves integration with the KDE desktop.
The private KStyle copy is adapted from FrameworkIntegration v5.62.0-2-gaa9e9a8 .

It builds against Qt 5.9.8 and up (tested with 5.9.8 and 5.12.4).

It will register as KFusion but also as Fusion, so that it replaces the built-in Fusion style in Qt builds where this style was disabled.

Visible differences:
- the "ButtonsHaveIcons" option is respected
- the highlight colour is taken from the current palette instead of a hardcoded electric blue on Mac
