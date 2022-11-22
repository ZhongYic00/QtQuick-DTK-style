#include "qmldpalette.hpp"
#include <QApplication>
#include <DApplication>
#include <QWindow>
#include <DGuiApplicationHelper>
#include <DPlatformTheme>

DWIDGET_USE_NAMESPACE
DGUI_USE_NAMESPACE
QMLDPalette::QMLDPalette()
{
    qWarning()<<"QMLDPalette()";
    connect(dynamic_cast<DApplication*>(DApplication::instance()),&QApplication::focusWindowChanged,this,&QMLDPalette::updateCg);
    connect(dynamic_cast<QApplication*>(QApplication::instance()),&QApplication::paletteChanged,this,&QMLDPalette::updatePalette);
    connect(this,&QMLDPalette::activeChanged,this,&QMLDPalette::updateCg);
    updateCg();
    updatePalette();
}
void QMLDPalette::updateCg(){
    qDebug()<<"updateCg"<<this<<_active;
    cg=(QApplication::activeWindow()!=nullptr||_active)?DPalette::Active:DPalette::Inactive;
    emitAll();
}
void QMLDPalette::updatePalette(){
    qDebug()<<"updatePalette"<<this;
    palette=DGuiApplicationHelper::instance()->applicationPalette();
    emitAll();
}
void QMLDPalette::emitAll(){
    emit styleChanged();

    emit windowTextChanged();
    emit buttonChanged();
    emit lightChanged();
    emit midlightChanged();
    emit darkChanged();
    emit midChanged();
    emit textChanged();
    emit brightTextChanged();
    emit buttonTextChanged();
    emit baseChanged();
    emit windowChanged();
    emit shadowChanged();
    emit highlightChanged();
    emit highlightedTextChanged();
    emit linkChanged();
    emit linkVisitedChanged();
    emit alternateBaseChanged();
    emit NoRoleChanged();
    emit toolTipBaseChanged();
    emit toolTipTextChanged();
    emit placeholderTextChanged();
    emit NColorRolesChanged();
    emit NoTypeChanged();
    emit itemBackgroundChanged();
    emit textTitleChanged();
    emit textTipsChanged();
    emit textWarningChanged();
    emit textLivelyChanged();
    emit lightLivelyChanged();
    emit darkLivelyChanged();
    emit frameBorderChanged();
    emit placeholderTextChanged();
    emit frameShadowBorderChanged();
    emit obviousBackgroundChanged();
    emit NColorTypesChanged();
}

void QMLDPalette::changeApplicationTheme(QMLDPalette::ThemeType theme){
    qDebug()<<"changeTheme"<<theme;
    switch(theme) {
        case Light:
            DGuiApplicationHelper::instance()->setPaletteType(DGuiApplicationHelper::LightType);
            break;
        case Dark:
            DGuiApplicationHelper::instance()->setPaletteType(DGuiApplicationHelper::DarkType);
            break;
        case System:
            DGuiApplicationHelper::instance()->setPaletteType(DGuiApplicationHelper::UnknownType);
            break;
        default:
            qWarning()<<"theme must be one of enum [Light,Dark,System]";
            break;
    }
}
