import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import QtQuick.Templates 2.12 as T
import singleton.dpalette 1.0

T.Button {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    horizontalPadding: smallRadius
    verticalPadding: smallRadius / 2
    Component.onCompleted: console.error("button", text, padding, width,
                                         icon.height, implicitContentWidth)

    opacity: control.enabled ? 1 : 0.4
    icon.width: 24
    icon.height: 24
    icon.color: control.checked
                || control.highlighted ? DPalette.highlightedText : control.flat
                                         && !control.down ? (control.visualFocus ? DPalette.highlight : DPalette.windowText) : control.down ? DPalette.highlight : DPalette.buttonText

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        anchors.fill: parent

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked
               || control.highlighted ? DPalette.highlightedText : control.flat
                                        && !control.down ? (control.visualFocus ? DPalette.highlight : DPalette.windowText) : control.down ? DPalette.highlight : DPalette.buttonText
    }
    background: Rectangle {
        radius: smallRadius
        color: DPalette.button
        Rectangle {
            radius: smallRadius
            anchors.fill: parent
            color: DPalette.highlight
            opacity: control.down ? 0.2 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutExpo
                }
            }
        }
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
        border.color: "#80888888"
    }
}
