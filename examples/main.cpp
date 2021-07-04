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

DWIDGET_USE_NAMESPACE
int main(int argc, char* argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    DApplication app(argc,argv);

    app.setApplicationName("hello world");

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
    widget.engine()->rootContext()->setContextProperty("smallRadius",8);
    widget.engine()->rootContext()->setContextProperty("bigRadius",18);
    const auto setColorGroup = [&](const QPalette& p){
        const char *colorGroupNames[] = {"Active", "Disabled", "Inactive", "NColorGroups", "Current", "All", "Normal"};
        QString cg=colorGroupNames[DPalette::ColorGroup(p.currentColorGroup())];
        std::cerr<<cg.toStdString();
        widget.engine()->rootContext()->setContextProperty("globalColorGroup",cg);
        widget.engine()->rootContext()->setContextProperty("dpaletteLightStyle",DGuiApplicationHelper::instance()->themeType()==DGuiApplicationHelper::LightType);
    };
    setColorGroup(QApplication::palette());
    QObject::connect(&app,&DApplication::paletteChanged,setColorGroup);
//    QObject::connect(&app,&DApplication::focusWindowChanged,setColorGroup1);
//    auto desktop = DApplication::desktop()->screen();
//    desktop->setGraphicsEffect(new QGraphicsBlurEffect);
//    widget.setGraphicsEffect(new QGraphicsBlurEffect);
    widget.setSource(url);
    widget.setResizeMode(QQuickWidget::SizeRootObjectToView);
    win.setCentralWidget(&widget);
    win.show();

    return app.exec();
}
