# - Find gtk3, glib
# Defines:
# GTK3_FOUND
# GTK3_INCLUDE_DIRS
# GTK3_LIBRARY_DIRS
# GTK3_DEFINITIONS
# GTK3_DEFINITIONS

FIND_PACKAGE(PkgConfig)

#
# gtk
#
PKG_CHECK_MODULES(PC_GTK3 REQUIRED gtk+-3.0)

SET(GTK3_DEFINITIONS ${PC_GTK3_CXXFLAGS_OTHER})

FIND_PATH(
	GTK3_INCLUDE_DIR gtk/gtk.h
	HINTS ${PC_GTK3_INCLUDEDIR} ${PC_GTK3_INCLUDE_DIRS}
	PATH_SUFFIXES gtk-3.0)

FIND_LIBRARY(
	GTK3_LIBRARY NAMES gtk-3
	HINTS ${PC_GTK3_LIBDIR} ${PC_GTK3_LIBRARY_DIRS})

#
# glib
#
PKG_CHECK_MODULES(PC_GLIB2 REQUIRED glib-2.0)

SET(GLIB2_DEFINITIONS ${PC_GLIB2_CXXFLAGS_OTHER})

FIND_PATH(
	GLIB2_INCLUDE_DIR_PART1 glib.h
	HINTS ${PC_GLIB2_INCLUDEDIR} ${PC_GLIB2_INCLUDE_DIRS}
	PATH_SUFFIXES glib-2.0)
	
FIND_PATH(
	GLIB2_INCLUDE_DIR_PART2 glibconfig.h
	HINTS ${PC_GLIB2_INCLUDEDIR} ${PC_GLIB2_INCLUDE_DIRS}
	PATH_SUFFIXES glib-2.0/include)

SET(GLIB2_INCLUDE_DIR ${GLIB2_INCLUDE_DIR_PART1} ${GLIB2_INCLUDE_DIR_PART2})

FIND_LIBRARY(
	GLIB2_LIBRARY NAMES glib-2.0
	HINTS ${PC_GLIB2_LIBDIR} ${PC_GLIB2_LIBRARY_DIRS})

#
# gobject
#
PKG_CHECK_MODULES(PC_GOBJECT2 REQUIRED gobject-2.0)

SET(GLIB2_DEFINITIONS ${PC_GOBJECT2_CXXFLAGS_OTHER})

FIND_PATH(
	GOBJECT2_INCLUDE_DIR_PART1 glib.h
	HINTS ${PC_GOBJECT2_INCLUDEDIR} ${PC_GOBJECT2_INCLUDE_DIRS}
	PATH_SUFFIXES gobject-2.0)
	
FIND_PATH(
	GOBJECT2_INCLUDE_DIR_PART2 gobject.h
	HINTS ${PC_GOBJECT2_INCLUDEDIR} ${PC_GOBJECT2_INCLUDE_DIRS}
	PATH_SUFFIXES glib-2.0/gobject)

SET(GOBJECT2_INCLUDE_DIR ${GOBJECT2_INCLUDE_DIR_PART1} ${GOBJECT2_INCLUDE_DIR_PART2})

FIND_LIBRARY(
	GOBJECT2_LIBRARY NAMES gobject-2.0
	HINTS ${PC_GOBJECT2_LIBDIR} ${PC_GOBJECT2_LIBRARY_DIRS})

#
# pango
#
PKG_CHECK_MODULES(PC_PANGO REQUIRED pango)

SET(PANGO_DEFINITIONS ${PC_PANGO_CXXFLAGS_OTHER})

FIND_PATH(
	PANGO_INCLUDE_DIR pango/pango.h
	HINTS ${PC_PANGO_INCLUDEDIR} ${PC_PANGO_INCLUDE_DIRS}
	PATH_SUFFIXES pango-1.0)

FIND_LIBRARY(
	PANGO_LIBRARY NAMES pango-1.0
	HINTS ${PC_PANGO_LIBDIR} ${PC_PANGO_LIBRARY_DIRS})

#
# cairo
#
PKG_CHECK_MODULES(PC_CAIRO REQUIRED cairo)

SET(CAIRO_DEFINITIONS ${PC_CAIRO_CXXFLAGS_OTHER})

FIND_PATH(
	CAIRO_INCLUDE_DIR cairo.h
	HINTS ${PC_CAIRO_INCLUDEDIR} ${PC_CAIRO_INCLUDE_DIRS}
	PATH_SUFFIXES cairo)

FIND_LIBRARY(
	CAIRO_LIBRARY NAMES cairo
	HINTS ${PC_CAIRO_LIBDIR} ${PC_CAIRO_LIBRARY_DIRS})

#
# gdk-pixbuf
#
PKG_CHECK_MODULES(PC_GDKPIXBUF REQUIRED gdk-pixbuf-2.0)

SET(GDKPIXBUF_DEFINITIONS ${PC_GDKPIXBUF_CXXFLAGS_OTHER})

FIND_PATH(
	GDKPIXBUF_INCLUDE_DIR gdk-pixbuf/gdk-pixbuf.h
	HINTS ${PC_GDKPIXBUF_INCLUDEDIR} ${PC_GDKPIXBUF_INCLUDE_DIRS}
	PATH_SUFFIXES gdk-pixbuf-2.0)

FIND_LIBRARY(
	GDKPIXBUF_LIBRARY NAMES gdk_pixbuf-2.0
	HINTS ${PC_GDKPIXBUF_LIBDIR} ${PC_GDKPIXBUF_LIBRARY_DIRS})

#
# atk
#
PKG_CHECK_MODULES(PC_ATK REQUIRED atk)

SET(ATK_DEFINITIONS ${PC_ATK_CXXFLAGS_OTHER})

FIND_PATH(
	ATK_INCLUDE_DIR atk/atk.h
	HINTS ${PC_ATK_INCLUDEDIR} ${PC_ATK_INCLUDE_DIRS}
	PATH_SUFFIXES atk-1.0)

FIND_LIBRARY(
	ATK_LIBRARY NAMES atk-1.0
	HINTS ${PC_ATK_LIBDIR} ${PC_ATK_LIBRARY_DIRS})

#
#
#result
#
#
SET(GTK3_LIBRARY_DIRS ${GTK3_LIBRARY} ${GLIB2_LIBRARY} ${PANGO_LIBRARY} ${CAIRO_LIBRARY} ${GDKPIXBUF_LIBRARY} ${ATK_LIBRARY})
SET(GTK3_INCLUDE_DIRS ${GTK3_INCLUDE_DIR} ${GLIB2_INCLUDE_DIR} ${PANGO_INCLUDE_DIR} ${CAIRO_INCLUDE_DIR} ${GDKPIXBUF_INCLUDE_DIR} ${ATK_INCLUDE_DIR})

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(
	GTK3 DEFAULT_MSG
	GTK3_LIBRARY GTK3_INCLUDE_DIR)

MARK_AS_ADVANCED(GTK3_INCLUDE_DIR GTK3_LIBRARY)
