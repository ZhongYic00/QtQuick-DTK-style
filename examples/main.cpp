#include <iostream>
#include <DApplication>
#include <DMainWindow>
#include <DPalette>
#include <DGuiApplicationHelper>
#include <QQmlApplicationEngine>
#include <QtQuickWidgets/QQuickWidget>
#include <QQmlContext>
#include <QDesktopWidget>
#include <QScreen>
#include <QGraphicsEffect>
#include <QLocale>
#include <QTranslator>
#include <QDir>
#include "include/qtquickdtk.h"

DWIDGET_USE_NAMESPACE
int main(int argc, char* argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    DApplication app(argc,argv);

    app.setApplicationName("QtQuick DTK");


    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString& locale : uiLanguages) {
        const QString baseName = "testQtQuick_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    DMainWindow win;
    QQuickWidget widget;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    auto desktop = DApplication::desktop()->screen();
//    desktop->setGraphicsEffect(new QGraphicsBlurEffect);
//    widget.setGraphicsEffect(new QGraphicsBlurEffect);
    enableQtQuickDTKStyle(widget.engine());
    widget.setSource(url);
    widget.setResizeMode(QQuickWidget::SizeRootObjectToView);
    win.setCentralWidget(&widget);

    WId proc2Window_HWND = WId(23069566);
    //TODO: create the proc 1 window delegate
    QWindow* proc1Widow = QWindow::fromWinId(proc2Window_HWND);

    //TODO: set the proxy widnow handle to proc 2 window
    win.setProperty("_q_embedded_native_parent_handle",QVariant(proc2Window_HWND));

    //TODO: set the proxy window to proc2 window for parent
    win.winId();
    //win.windowHandle()->setParent(proc1Widow);
    win.resize(1920,1040);
    win.move(0,0);

    win.show();

    return app.exec();
}
