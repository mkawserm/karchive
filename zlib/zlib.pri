INCLUDEPATH += $$PWD

HEADERS += \
    $$PWD/zlib.h \
    $$PWD/deflate.h \
    $$PWD/gzguts.h \
    $$PWD/inflate.h \
    $$PWD/zconf.h \
    $$PWD/zutil.h \
    $$PWD/crc32.h \
    $$PWD/inffixed.h \
    $$PWD/inffast.h \
    $$PWD/inftrees.h \
    $$PWD/trees.h

SOURCES += \
    $$PWD/deflate.c \
    $$PWD/gzlib.c \
    $$PWD/gzwrite.c \
    $$PWD/inffast.c \
    $$PWD/inftrees.c \
    $$PWD/zutil.c \
    $$PWD/trees.c \
    $$PWD/adler32.c \
    $$PWD/compress.c \
    $$PWD/crc32.c \
    $$PWD/gzread.c \
    $$PWD/infback.c \
    $$PWD/inflate.c \
    $$PWD/uncompr.c \
    $$PWD/gzclose.c
