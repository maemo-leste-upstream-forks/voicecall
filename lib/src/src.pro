TEMPLATE = lib
TARGET = voicecall

QT = core dbus

CONFIG += c++11

CONFIG += compile_libtool create_libtool
CONFIG += create_pc create_prl no_install_prl

HEADERS += \
    common.h \
    voicecallmanagerinterface.h \
    abstractvoicecallhandler.h \
    abstractvoicecallprovider.h \
    abstractvoicecallmanagerplugin.h \
    dbus/voicecallmanagerdbusadapter.h \
    dbus/voicecallhandlerdbusadapter.h

SOURCES += \
    dbus/voicecallmanagerdbusadapter.cpp \
    dbus/voicecallhandlerdbusadapter.cpp \
    abstractvoicecallhandler.cpp \
    common.cpp


OTHER_FILES +=

headers.path = /usr/include/voicecall
headers.files = $${HEADERS}
headers.target = voicecall

target.path = $$[QT_INSTALL_LIBS]

INSTALLS += target headers

QMAKE_PKGCONFIG_FILE = $${TARGET}
# This fills in the Name property
QMAKE_PKGCONFIG_NAME = $${TARGET}
# This fills in the Description property
QMAKE_PKGCONFIG_DESCRIPTION = libvoicecall pkgconfig
QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_INCDIR = $$headers.path
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_PREFIX = $${PREFIX}
