import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import DPalette 1.0

T.TextField {
    id: control

    implicitWidth: Math.max(
                       implicitBackgroundWidth + leftInset + rightInset,
                       Math.max(
                           contentWidth,
                           placeholder.implicitWidth) + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        contentHeight + topPadding + bottomPadding,
                        placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6
    leftPadding: padding + 4
    rightPadding: 36

    color: DPalette.text
    selectionColor: DPalette.highlight
    selectedTextColor: DPalette.highlightedText
    placeholderTextColor: Color.transparent(control.color, 0.5)
    verticalAlignment: TextInput.AlignVCenter
    selectByMouse: true

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText
                 && (!control.activeFocus
                     || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        radius: smallRadius
        border.width: control.activeFocus ? 2 : 1
        color: control.activeFocus ? DPalette.light : DPalette.light
        border.color: control.activeFocus ? DPalette.highlight : DPalette.mid
    }
    RoundButton {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        opacity: placeholder.visible ? 0 : 1
        icon.name: "cancel"
        color: DPalette.base
        Behavior on opacity {
            NumberAnimation {
                duration: 150
                easing.type: Easing.InCurve
            }
        }
        onClicked: clear()
    }
}
