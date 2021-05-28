QT += quick
CONFIG += c++11
QT += widgets

SOURCES += \
        helper.cpp \
        main.cpp

RESOURCES += qml.qrc

TRANSLATIONS += \
    task_4_ru_RU.ts
QML_IMPORT_PATH =
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    helper.h
