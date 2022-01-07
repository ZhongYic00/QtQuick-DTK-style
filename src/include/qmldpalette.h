#ifndef QMLDPALETTE_H
#define QMLDPALETTE_H

#include <QObject>
#include <DPalette>

DGUI_USE_NAMESPACE
class QMLDPalette:public QObject{
    Q_OBJECT
    Q_PROPERTY(QColor windowText READ windowText NOTIFY windowTextChanged)
    Q_PROPERTY(QColor button READ button NOTIFY buttonChanged)
    Q_PROPERTY(QColor light READ light NOTIFY lightChanged)
    Q_PROPERTY(QColor midlight READ midlight NOTIFY midlightChanged)
    Q_PROPERTY(QColor dark READ dark NOTIFY darkChanged)
    Q_PROPERTY(QColor mid READ mid NOTIFY midChanged)
    Q_PROPERTY(QColor text READ text NOTIFY textChanged)
    Q_PROPERTY(QColor brightText READ brightText NOTIFY brightTextChanged)
    Q_PROPERTY(QColor buttonText READ buttonText NOTIFY buttonTextChanged)
    Q_PROPERTY(QColor base READ base NOTIFY baseChanged)
    Q_PROPERTY(QColor window READ window NOTIFY windowChanged)
    Q_PROPERTY(QColor shadow READ shadow NOTIFY shadowChanged)
    Q_PROPERTY(QColor highlight READ highlight NOTIFY highlightChanged)
    Q_PROPERTY(QColor highlightedText READ highlightedText NOTIFY highlightedTextChanged)
    Q_PROPERTY(QColor link READ link NOTIFY linkChanged)
    Q_PROPERTY(QColor linkVisited READ linkVisited NOTIFY linkVisitedChanged)
    Q_PROPERTY(QColor alternateBase READ alternateBase NOTIFY alternateBaseChanged)
    Q_PROPERTY(QColor NoRole READ NoRole NOTIFY NoRoleChanged)
    Q_PROPERTY(QColor toolTipBase READ toolTipBase NOTIFY toolTipBaseChanged)
    Q_PROPERTY(QColor toolTipText READ toolTipText NOTIFY toolTipTextChanged)
    Q_PROPERTY(QColor placeholderText READ placeholderText NOTIFY placeholderTextChanged)
    Q_PROPERTY(QColor NColorRoles READ NColorRoles NOTIFY NColorRolesChanged)
    Q_PROPERTY(QColor NoType READ NoType NOTIFY NoTypeChanged)
    Q_PROPERTY(QColor itemBackground READ itemBackground NOTIFY itemBackgroundChanged)
    Q_PROPERTY(QColor textTitle READ textTitle NOTIFY textTitleChanged)
    Q_PROPERTY(QColor textTips READ textTips NOTIFY textTipsChanged)
    Q_PROPERTY(QColor textWarning READ textWarning NOTIFY textWarningChanged)
    Q_PROPERTY(QColor textLively READ textLively NOTIFY textLivelyChanged)
    Q_PROPERTY(QColor lightLively READ lightLively NOTIFY lightLivelyChanged)
    Q_PROPERTY(QColor darkLively READ darkLively NOTIFY darkLivelyChanged)
    Q_PROPERTY(QColor frameBorder READ frameBorder NOTIFY frameBorderChanged)
    Q_PROPERTY(QColor frameShadowBorder READ frameShadowBorder NOTIFY frameShadowBorderChanged)
    Q_PROPERTY(QColor obviousBackground READ obviousBackground NOTIFY obviousBackgroundChanged)
    Q_PROPERTY(QColor NColorTypes READ NColorTypes NOTIFY NColorTypesChanged)
public:
    QMLDPalette();
    inline QColor windowText() const{ return palette.color(cg,DPalette::WindowText);}
    inline QColor button() const{ return palette.color(cg,DPalette::Button);}
    inline QColor light() const{ return palette.color(cg,DPalette::Light);}
    inline QColor midlight() const{ return palette.color(cg,DPalette::Midlight);}
    inline QColor dark() const{ return palette.color(cg,DPalette::Dark);}
    inline QColor mid() const{ return palette.color(cg,DPalette::Mid);}
    inline QColor text() const{ return palette.color(cg,DPalette::Text);}
    inline QColor brightText() const{ return palette.color(cg,DPalette::BrightText);}
    inline QColor buttonText() const{ return palette.color(cg,DPalette::ButtonText);}
    inline QColor base() const{ return palette.color(cg,DPalette::Base);}
    inline QColor window() const{ return palette.color(cg,DPalette::Window);}
    inline QColor shadow() const{ return palette.color(cg,DPalette::Shadow);}
    inline QColor highlight() const{ return palette.color(cg,DPalette::Highlight);}
    inline QColor highlightedText() const{ return palette.color(cg,DPalette::HighlightedText);}
    inline QColor link() const{ return palette.color(cg,DPalette::Link);}
    inline QColor linkVisited() const{ return palette.color(cg,DPalette::LinkVisited);}
    inline QColor alternateBase() const{ return palette.color(cg,DPalette::AlternateBase);}
    inline QColor NoRole() const{ return palette.color(cg,DPalette::NoRole);}
    inline QColor toolTipBase() const{ return palette.color(cg,DPalette::ToolTipBase);}
    inline QColor toolTipText() const{ return palette.color(cg,DPalette::ToolTipText);}
    inline QColor placeholderText() const{ return palette.color(cg,DPalette::PlaceholderText);}
    inline QColor NColorRoles() const{ return palette.color(cg,DPalette::NColorRoles);}
    inline QColor NoType() const{ return palette.color(cg,DPalette::NoType);}
    inline QColor itemBackground() const{ return palette.color(cg,DPalette::ItemBackground);}
    inline QColor textTitle() const{ return palette.color(cg,DPalette::TextTitle);}
    inline QColor textTips() const{ return palette.color(cg,DPalette::TextTips);}
    inline QColor textWarning() const{ return palette.color(cg,DPalette::TextWarning);}
    inline QColor textLively() const{ return palette.color(cg,DPalette::TextLively);}
    inline QColor lightLively() const{ return palette.color(cg,DPalette::LightLively);}
    inline QColor darkLively() const{ return palette.color(cg,DPalette::DarkLively);}
    inline QColor frameBorder() const{ return palette.color(cg,DPalette::FrameBorder);}
    inline QColor frameShadowBorder() const{ return palette.color(cg,DPalette::FrameShadowBorder);}
    inline QColor obviousBackground() const{ return palette.color(cg,DPalette::ObviousBackground);}
    inline QColor NColorTypes() const{ return palette.color(cg,DPalette::NColorTypes);}
signals:
    void windowTextChanged();
    void buttonChanged();
    void lightChanged();
    void midlightChanged();
    void darkChanged();
    void midChanged();
    void textChanged();
    void brightTextChanged();
    void buttonTextChanged();
    void baseChanged();
    void windowChanged();
    void shadowChanged();
    void highlightChanged();
    void highlightedTextChanged();
    void linkChanged();
    void linkVisitedChanged();
    void alternateBaseChanged();
    void NoRoleChanged();
    void toolTipBaseChanged();
    void toolTipTextChanged();
    void placeholderTextChanged();
    void NColorRolesChanged();
    void NoTypeChanged();
    void itemBackgroundChanged();
    void textTitleChanged();
    void textTipsChanged();
    void textWarningChanged();
    void textLivelyChanged();
    void lightLivelyChanged();
    void darkLivelyChanged();
    void frameBorderChanged();
    void frameShadowBorderChanged();
    void obviousBackgroundChanged();
    void NColorTypesChanged();
    void styleChanged();
public slots:
    void updateCg();
    void updatePalette();
private:
    DPalette palette;
    DPalette::ColorGroup cg;

    void emitAll();
};

#endif // QMLDPALETTE_H
