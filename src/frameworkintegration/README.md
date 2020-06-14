# Framework Integration

Integration of Qt application with KDE workspaces

This is a modified subset synced at upstream v5.62.0-2-gaa9e9a8

## Introduction

Framework Integration is a set of plugins responsible for better integration of
Qt applications when running on a KDE Plasma workspace.

Applications do not need to link to this directly.

## Components

### KF5Style

The library KF5Style provides integration with KDE Plasma Workspace
settings for Qt styles.

Derive your Qt style from KStyle to automatically inherit various
settings from the KDE Plasma Workspace, providing a consistent user
experience. For example, this will ensure a consistent single-click
or double-click activation setting, and the use of standard themed
icons.

