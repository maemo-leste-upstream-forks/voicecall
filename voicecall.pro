TEMPLATE = subdirs
SUBDIRS += src lib plugins

plugins.depends = lib
src.depends = lib

OTHER_FILES = LICENSE makedist rpm/voicecall-qt5.spec


oneshot.files = oneshot/phone-move-recordings-dir
oneshot.path  = $$[QT_INSTALL_PREFIX]/lib/oneshot.d

telepathy.files = telepathy/voicecall.client
telepathy.path = $$[QT_INSTALL_PREFIX]/share/telepathy/client

INSTALLS += oneshot telepathy
