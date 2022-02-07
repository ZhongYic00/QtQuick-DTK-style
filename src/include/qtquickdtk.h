#ifndef QTQUICKDTK_H
#define QTQUICKDTK_H

#include <QtQuickControls2/QQuickStyle>
#include <QQmlEngine>
#include <QQmlContext>
#include <QTimer>
#include <DApplication>
#include <DGuiApplicationHelper>
#include <DPlatformTheme>
#include <iostream>
#include "qmldpalette.h"

DWIDGET_USE_NAMESPACE
void importProperties(QQmlEngine* engine){
    engine->rootContext()->setContextProperty("smallRadius",8);
    engine->rootContext()->setContextProperty("bigRadius",18);

    qmlRegisterType<QMLDPalette>("QMLDPalette",1,0,"QMLDPalette");
    qmlRegisterSingletonType(QUrl("qrc:/dtk/DPalette.qml"),"singleton.dpalette",1,0,"DPalette");
}
void enableQtQuickDTKStyle(QQmlEngine* engine){
    QQuickStyle::addStylePath("qrc:/dtk");
    importProperties(engine);
}
#endif // QTQUICKDTK_H
