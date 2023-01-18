TEMPLATE = lib
TARGET = qtvoicecall

QT = core dbus multimedia

CONFIG += c++11
CONFIG += compile_libtool create_libtool
CONFIG += create_pc create_prl no_install_prl
CONFIG += link_pkgconfig
# This disables making a .la file
#CONFIG += plugin

# just for common.h
INCLUDEPATH += $$PWD/../../../lib/src

HEADERS += \
    voicecallaudiorecorder.h \
    voicecallhandler.h \
    voicecallmanager.h \
    voicecallmodel.h \
    voicecallprovidermodel.h

SOURCES += \
    voicecallaudiorecorder.cpp \
    voicecallhandler.cpp \
    voicecallmanager.cpp \
    voicecallmodel.cpp \
    voicecallprovidermodel.cpp \
    ../../../lib/src/common.cpp

headers.path = /usr/include/qtvoicecall
headers.files = $${HEADERS}
headers.target = qtvoicecall


target.path = $$[QT_INSTALL_LIBS]

INSTALLS += target headers

QMAKE_PKGCONFIG_FILE = $${TARGET}
# This fills in the Name property
QMAKE_PKGCONFIG_NAME = $${TARGET}
# This fills in the Description property
QMAKE_PKGCONFIG_DESCRIPTION = libqtvoicecall pkgconfig
QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_INCDIR = $$headers.path
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_PREFIX = $${PREFIX}

