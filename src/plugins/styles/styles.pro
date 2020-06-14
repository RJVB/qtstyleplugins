CONFIG += options
TEMPLATE = subdirs

CONFIG(cleanlooks) {
    message("Building the cleanlooks style plugin")
    SUBDIRS += cleanlooks
}

CONFIG(plastique) {
    message("Building the plastique style plugin")
    SUBDIRS += plastique
}

CONFIG(gtk2) {
    packagesExist(gtk+-2.0 x11) {
        message("Building the GTk2 style plugin")
        SUBDIRS += gtk2
    }
}
