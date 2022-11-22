#include "qtquickdtk.h"
void importProperties(QQmlEngine* engine){
    engine->rootContext()->setContextProperty("smallRadius",8);
    engine->rootContext()->setContextProperty("bigRadius",18);

    // qWarning()<<"importProperties::registerType"<<qmlRegisterType<QMLDPalette>("QMLDPalette",1,0,"QMLDPalette");
    // qWarning()<<"importProperties::registerSingleton"<<qmlRegisterSingletonType(QUrl("qrc:/dtk/DPalette.qml"),"DPalette",1,0,"DPalette");
}

void enableQtQuickDTKStyle(QQmlEngine* engine){
    QQuickStyle::addStylePath("qrc:/dtk");
    importProperties(engine);
    qWarning()<<"enableQtQuickDTKStyle:: styles"<<QQuickStyle::stylePathList()<<QQuickStyle::name();
}
