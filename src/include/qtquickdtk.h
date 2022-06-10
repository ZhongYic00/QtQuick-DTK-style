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
void importProperties(QQmlEngine* engine);
void enableQtQuickDTKStyle(QQmlEngine* engine);
#endif // QTQUICKDTK_H
