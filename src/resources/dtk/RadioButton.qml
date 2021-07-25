import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtGraphicalEffects 1.15
import QtQuick.Templates 2.12 as T

T.RadioButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        implicitContentHeight + topPadding + bottomPadding,
                        implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 0
    spacing: 6
    property color color: control.palette.highlight

    // keep in sync with RadioDelegate.qml (shared RadioIndicator.qml was removed for performance reasons)
    indicator: Rectangle {
        implicitWidth: 32
        implicitHeight: implicitWidth
        radius: width / 2
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            property int inset: 4 + parent.border.width
            width: parent.width - 2 * inset
            height: width
            radius: parent.radius - inset
            color: control.color
            Component.onCompleted: console.error("inner", inset, width,
                                                 radius, x, y)
            layer.enabled: true
            layer.effect: DropShadow {
                color: Qt.rgba(control.color.r, control.color.g,
                               control.color.b, 0.3)
                verticalOffset: radius
                radius: 8
                samples: 17
            }
        }

        opacity: enabled ? 1 : 0.3
        color: "transparent"
        border.color: control.checked ? control.color : "transparent"
        border.width: 2
    }

    contentItem: CheckLabel {
        leftPadding: control.indicator
                     && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator
                      && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.palette.windowText
    }
}
