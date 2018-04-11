#-------------------------------------------------
#
# Project created by QtCreator 2018-04-10T04:25:55
#
#-------------------------------------------------

#################################
# karchive version: 5.43.0
#################################

TARGET = karchive
TEMPLATE = lib
CONFIG += c++11
QT -= gui
QT += core

!win32:VERSION = 1.0.0

include(zlib/zlib.pri)
include(karchive.pri)


#CONFIG(debug, debug|release) {
#     mac: TARGET = $$join(TARGET,,,_debug)
#     win32: TARGET = $$join(TARGET,,,d)
#}

TEMPNAME = $${QMAKE_QMAKE}
QTPATH = $$dirname(TEMPNAME)

#OBJECTS_DIR=.obj
#MOC_DIR=.moc

#message($$[QT_HOST_LIBS])
unix{
    CONFIG += lib_bundle
    #headers.path=$$QTPATH/../include/karchive
    #headers.files=$$KARCHIVE_PUBLIC_HEADERS
    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
    INSTALLS += target

    FRAMEWORK_HEADERS.version = Versions
    FRAMEWORK_HEADERS.files = $$KARCHIVE_PUBLIC_HEADERS
    FRAMEWORK_HEADERS.path = Headers
    QMAKE_BUNDLE_DATA += FRAMEWORK_HEADERS

    target.path=$$QTPATH/../lib/$${LIB_ARCH}
}


win32 {
    headers.path=$$[QT_INSTALL_HEADERS]/karchive
    headers.files=$$KARCHIVE_PUBLIC_HEADERS
    CONFIG(staticlib){
        target.path=$$PREFIX/lib
        QMAKE_PKGCONFIG_LIBDIR = $$PREFIX/lib/
    } else {
        target.path=$$PREFIX/bin
        QMAKE_PKGCONFIG_LIBDIR = $$PREFIX/bin/
    }
    INSTALLS += headers target
    ## odd, this path seems to be relative to the
    ## target.path, so if we install the .dll into
    ## the 'bin' dir, the .pc will go there as well,
    ## unless have hack the needed path...
    ## TODO any nicer solution?
    #QMAKE_PKGCONFIG_DESTDIR = ../lib/pkgconfig
    # workaround for qdatetime.h macro bug
}


android{
    headers.path=$$[QT_INSTALL_HEADERS]/karchive
    headers.files=$$KARCHIVE_PUBLIC_HEADERS

    #target.path=$$[QT_HOST_LIBS]
    INSTALLS += headers
}

DEFINES+=DEBAO_BUILDING_KDE5TIER1

win32: LIBS += -ladvapi32
msvc*: DEFINES += _CRT_SECURE_NO_WARNINGS

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

## Creating pkgconfig .pc file
#CONFIG += create_prl install_prl create_pc
#CONFIG += link_prl

#QMAKE_PKGCONFIG_PREFIX = $$PREFIX
#QMAKE_PKGCONFIG_INCDIR = $$headers.path
#QMAKE_PKGCONFIG_REQUIRES = Qt5Core
