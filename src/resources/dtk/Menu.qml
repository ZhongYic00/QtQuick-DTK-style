import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.15
import DPalette 1.0

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
    clip: true

    delegate: MenuItem {
        contentItem: Text {
            color: parent.highlighted ? DPalette.highlightedText : DPalette.text
            text: parent.text
        }
        background: Rectangle {
            color: parent.highlighted ? DPalette.highlight : "transparent"
            layer.enabled: true
            layer.effect: DropShadow {
                radius: smallRadius
                samples: 17
                verticalOffset: smallRadius / 2
                color: Color.transparent(DPalette.highlight, 0.5)
                transparentBorder: true
            }
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
        color: Color.transparent(DPalette.window, 0.9)
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
        ShaderEffectSource {
            function getRect() {
                console.log(x, y, width, height, sourceItem,
                            mapToItem(sourceItem, x, y),
                            control.parent.mapToGlobal(control.x, control.y))
                return mapToItem(sourceItem, Qt.rect(x, y, width, height))
            }
            id: effectsource
            anchors.fill: parent

            sourceItem: ApplicationWindow.window ? ApplicationWindow.window.contentItem : null

            sourceRect: getRect()
            onSourceRectChanged: console.warn('window', sourceItem, sourceRect,
                                              control.x, control.y,
                                              control.width, control.height,
                                              blur.width, blur.height)
        }
        FastBlur {
            id: blur
            anchors.fill: parent
            source: effectsource
            radius: 32
            transparentBorder: false
        }
    }

    //    T.Overlay.modal: Rectangle {
    //        color: Color.transparent(control.palette.shadow, 0.8)
    //    }

    //    T.Overlay.modeless: Rectangle {
    //        color: Color.transparent(control.palette.shadow, 0.8)
    //    }
}
