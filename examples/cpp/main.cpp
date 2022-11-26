#include <iostream>
#include <DApplication>
#include <DMainWindow>
#include <DPalette>
#include <DGuiApplicationHelper>
#include <DTitlebar>
#include <QQmlApplicationEngine>
#include <QtQuickWidgets/QQuickWidget>
#include <QQmlContext>
#include <QDesktopWidget>
#include <QScreen>
#include <QGraphicsEffect>
#include <QLocale>
#include <QTranslator>
#include <QDir>
#include <QQuickItem>
#include "qtquickdtk.h"

DWIDGET_USE_NAMESPACE
int main(int argc, char* argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    DApplication app(argc,argv);

    app.setApplicationName("testQtQuick");


    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString& locale : uiLanguages) {
        const QString baseName = "testQtQuick_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QQmlApplicationEngine win(&app);

    enableQtQuickDTKStyle(&win);
    win.load(url);
//    win.(QQuickWidget::SizeRootObjectToView);
//    win.setCentralWidget(&widget);
//    win.show();

//    win.show();

    return app.exec();
}
