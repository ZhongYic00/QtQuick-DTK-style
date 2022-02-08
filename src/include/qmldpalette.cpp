#include "qmldpalette.h"
#include <QApplication>
#include <QWindow>
#include <DApplication>
#include <DGuiApplicationHelper>

DWIDGET_USE_NAMESPACE
DGUI_USE_NAMESPACE
QMLDPalette::QMLDPalette()
{
    connect(dynamic_cast<DApplication*>(DApplication::instance()),&QApplication::focusWindowChanged,this,&QMLDPalette::updateCg);
    connect(dynamic_cast<QApplication*>(QApplication::instance()),&QApplication::paletteChanged,this,&QMLDPalette::updatePalette);
    updateCg();
    updatePalette();
}
void QMLDPalette::updateCg(){
    qWarning()<<"updateCg"<<this;
    cg=(QApplication::activeWindow()!=nullptr)?DPalette::Active:DPalette::Inactive;
    emitAll();
}
void QMLDPalette::updatePalette(){
//    qWarning()<<"updatePalette"<<this;
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