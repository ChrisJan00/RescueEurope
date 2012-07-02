#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "soundclip.h"

#include <QtDeclarative>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    MixerInstance mI;
    if (!mI.isValid())
        return -1;

    qmlRegisterType<SoundClip>("MultimediaExports",1,0,"SoundClip");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/rescueFull/europ.qml"));
//    viewer.setMainQmlFile(QLatin1String("qml/rescueFull/Sounds.qml"));
    viewer.showExpanded();

    return app->exec();
}
