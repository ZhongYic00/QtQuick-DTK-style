import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.15
import singleton.dpalette 1.0

T.Menu {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding, 200)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    margins: 0
    overlap: 1
    topPadding: smallRadius
    bottomPadding: smallRadius

    delegate: MenuItem {
        contentItem: Text {
            color: parent.highlighted ? DPalette.highlightedText : DPalette.text
            text: parent.text
        }
        background: Rectangle {
            color: parent.highlighted ? DPalette.highlight : "transparent"
        }
        arrow: ColorImage {
            x: parent.mirrored ? parent.leftPadding : parent.width - width - parent.rightPadding
            y: parent.topPadding + (parent.availableHeight - height) / 2

            visible: parent.subMenu
            mirror: parent.mirrored
            source: parent.subMenu ? "qrc:/qt-project.org/imports/QtQuick/Controls.2/images/arrow-indicator.png" : ""
            color: parent.highlighted ? DPalette.highlightedText : DPalette.windowText
        }
    }
    contentItem: Column {}

    background: Rectangle {
        radius: smallRadius
        color: DPalette.window
        anchors.fill: parent
        border.color: DPalette.frameBorder
        border.width: 1
        layer.enabled: true
        layer.effect: DropShadow {
            radius: bigRadius
            samples: 17
            color: DPalette.frameShadowBorder
            transparentBorder: true
        }
    }

    //    T.Overlay.modal: Rectangle {
    //        color: Color.transparent(control.palette.shadow, 0.5)
    //    }

    //    T.Overlay.modeless: Rectangle {
    //        color: Color.transparent(control.palette.shadow, 0.12)
    //    }
}
