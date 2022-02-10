import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.15
import singleton.dpalette 1.0

T.Popup {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    height: Math.min(contentItem.implicitHeight + 2 * smallRadius,
                     control.Window.height - topMargin - bottomMargin)
    padding: 0
    topMargin: 6
    bottomMargin: topMargin

    background: Rectangle {
        radius: smallRadius
        color: DPalette.window
        anchors.fill: parent
        layer.enabled: true
        layer.effect: DropShadow {
            radius: 8
            samples: 17
            color: DPalette.shadow
            transparentBorder: true
        }
    }
    T.Overlay.modal: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.5)
    }

    T.Overlay.modeless: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.12)
    }
    enter: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 150
        }
    }
}
