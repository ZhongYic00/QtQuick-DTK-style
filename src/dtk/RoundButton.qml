import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtGraphicalEffects 1.15
import QtQuick.Templates 2.12 as T
import DPalette 1.0

T.RoundButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 0
    spacing: -6
    radius: 12
    checkable: true
    property color color: DPalette.base
    icon.height: height - 6
    icon.width: width - 6
    icon.color: DPalette.text


    /*icon.width: 24
    icon.height: 24
                icon.color: control.checked
                                                    || control.highlighted ? DPalette.highlightedText : control.flat
                                                                                                                                                         && !control.down ? (control.visualFocus ? DPalette.highlight : DPalette.windowText) : DPalette.buttonText*/
    contentItem: IconLabel {
        width: (control.radius - 3) * 2
        height: width
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font: control.font
        //        color: control.checked
        //               || control.highlighted ? DPalette.brightText : control.flat
        //                                        && !control.down ? (control.visualFocus ? DPalette.highlight : DPalette.windowText) : DPalette.buttonText
    }

    background: Rectangle {
        implicitWidth: 2 * control.radius
        implicitHeight: implicitWidth
        radius: control.radius
        opacity: enabled ? 1 : 0.3
        color: control.color
        border.color: control.checked ? control.color : "transparent"
        border.width: 2
        layer.enabled: true
        layer.effect: DropShadow {
            color: DPalette.frameShadowBorder
            verticalOffset: 0
            radius: 8
            samples: 17
        }
        Rectangle {
            radius: parent.radius
            anchors.fill: parent
            color: DPalette.button
            opacity: control.down ? 0.3 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutExpo
                }
            }
        }
    }
}
