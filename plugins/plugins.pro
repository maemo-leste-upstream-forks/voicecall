TEMPLATE = subdirs
SUBDIRS = declarative providers playback-manager qtvoicecall
#SUBDIRS = declarative providers playback-manager mce qtvoicecall

enable-ngf {
    SUBDIRS += ngf
}
