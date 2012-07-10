# Add more folders to ship with the application, here
#folder_01.source = qml
#folder_01.target = qml
#DEPLOYMENTFOLDERS = folder_01
QT += declarative

macx {
  LIBS += -framework SDL
  LIBS += -framework SDL_mixer
} else {
  LIBS += -lSDL -lSDL_mixer
}

#INCLUDEPATH += /Library/Frameworks/SDL_mixer.Framework/Headers

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE2A1685B

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
#symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    soundclip.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    soundclip.h

RESOURCES += \
    RescueEurope.qrc

OTHER_FILES += \
    qml/Button.qml \
    qml/Fireworks.qml \
    qml/Panel.qml \
    qml/Country.qml \
    qml/LoanDialog.qml \
    qml/LooseScreen.qml \
    qml/RescueDialog.qml \
    qml/StartDialog.qml \
    qml/DialogBG.qml \
    qml/Map.qml \
    qml/VictoryDialog.qml \
    qml/europ.qml \
    qml/OwingDialog.qml \
    qml/ReturnDialog.qml \
    qml/VictoryScreen.qml
