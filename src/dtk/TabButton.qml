import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

T.TabButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    width: contentItem.implicitWidth + leftPadding + rightPadding

    horizontalPadding: smallRadius
    verticalPadding: smallRadius / 2
    Component.onCompleted: width = Math.min(width, 120)
    DPalette {
        id: dpalette
    }
    icon.width: 24
    icon.height: 24
    icon.color: control.checked
                || control.highlighted ? dpalette.highlightedText : control.flat
                                         && !control.down ? (control.visualFocus ? dpalette.highlight : dpalette.windowText) : control.down ? dpalette.highlight : dpalette.buttonText

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        implicitWidth: 80

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked
               || control.highlighted ? dpalette.highlightedText : control.flat
                                        && !control.down ? (control.visualFocus ? dpalette.highlight : dpalette.windowText) : control.down ? dpalette.highlight : dpalette.buttonText
    }
    background: Rectangle {
        radius: smallRadius
        color: Color.blend(
                   control.checked ? dpalette.highlight : dpalette.dark,
                   dpalette.mid, control.down ? 0.5 : 0.0)
        Rectangle {
            radius: smallRadius
            anchors.fill: parent
            color: Qt.rgba(0, 0, 0)
            opacity: control.hovered ? 0.1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutExpo
                }
            }
        }
    }
}
