import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import singleton.dpalette 1.0

T.TabButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    width: contentItem.implicitWidth + leftPadding + rightPadding
    horizontalPadding: smallRadius
    verticalPadding: smallRadius / 2
    Component.onCompleted: {
        console.warn('tabbutton', width, implicitBackgroundWidth,
                     implicitContentWidth, implicitWidth, leftPadding)
        width = Math.min(width, 120)
    }

    icon.width: 24
    icon.height: 24
    icon.color: control.checked
                || control.highlighted ? DPalette.highlightedText : control.flat
                                         && !control.down ? (control.visualFocus ? DPalette.highlight : DPalette.windowText) : control.down ? DPalette.highlight : DPalette.buttonText

    contentItem:
        /*Item {
        implicitWidth: 80
        implicitHeight: Math.max(textlabel.implicitHeight,
                                 iconimg.implicitHeight)
        clip: true
        Component.onCompleted: console.warn('row', width, height,
                                            implicitHeight)
        IconImage {
            id: iconimg
            anchors.verticalCenter: parent.verticalCenter
            source: icon.source
            name: icon.name
            width: icon.width
            height: icon.height
            color: icon.color
            visible: source.length || name.length
        }
        Text {
            id: textlabel
            anchors.left: iconimg.right
            anchors.right: parent.right
            Component.onCompleted: console.warn('text', width, height,
                                                implicitHeight)
            text: control.text
            elide: Text.ElideRight
            font.pixelSize: bigRadius
            color: control.checked
                   || control.highlighted ? DPalette.highlightedText : control.flat
                                            && !control.down ? (control.visualFocus ? DPalette.highlight : DPalette.windowText) : control.down ? DPalette.highlight : DPalette.buttonText
        }
        ToolTip.visible: textlabel.truncated && hovered
        ToolTip.text: text
    }*/
        IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        implicitWidth: 80

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked
               || control.highlighted ? DPalette.highlightedText : control.flat
                                        && !control.down ? (control.visualFocus ? DPalette.highlight : DPalette.windowText) : control.down ? DPalette.highlight : DPalette.buttonText
    }
    background: Rectangle {
        radius: smallRadius
        color: Color.blend(
                   control.checked ? DPalette.highlight : DPalette.dark,
                   DPalette.mid, control.down ? 0.5 : 0.0)
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
