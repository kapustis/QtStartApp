QT       += core gui  widgets

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

TARGET = StartApp
TEMPLATE = app

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# set BUILD_DIR
CONFIG(debug, debug|release) {
BUILD_FLAG = debug_$${QT_VERSION}
} else {
BUILD_FLAG = release_$${QT_VERSION}
}

ARCH_SUFFIX = x32
contains(QT_ARCH, x86_64) {
ARCH_SUFFIX = x64
} else {
ARCH_SUFFIX = x32
}

#win32:MAKE_DIR      = OS_WIN_$${RLS_BUILD_PATH}_$${ARCH_SUFFIX}
#unix:qnx:MAKE_DIR   = OS_QNX_$${RLS_BUILD_PATH}_$${ARCH_SUFFIX}
win32:MAKE_DIR      = OS_WIN_$${ARCH_SUFFIX}
unix:qnx:MAKE_DIR   = OS_QNX_$${ARCH_SUFFIX}

BUILD_DIR           = $${MAKE_DIR}/$${BUILD_FLAG}

DESTDIR             = $$PWD/$${BUILD_DIR}

UI_DIR              = $$PWD/$${BUILD_DIR}/UI
OBJECTS_DIR         = $$PWD/$${BUILD_DIR}/OBJECTS_DIR
MOC_DIR             = $$PWD/$${BUILD_DIR}/MOC
RCC_DIR             = $$PWD/$${BUILD_DIR}/RCC

MAKEFILE            = Makefile_$${QT_VERSION}
#set BUILD_DIR

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
