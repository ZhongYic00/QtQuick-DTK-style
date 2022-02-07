import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import singleton.dpalette 1.0

T.SpinBox {
    id: control

    implicitWidth: Math.max(
                       implicitBackgroundWidth + leftInset + rightInset,
                       contentItem.implicitWidth + 2 * padding
                       + up.implicitIndicatorWidth + down.implicitIndicatorWidth)
    implicitHeight: Math.max(
                        implicitContentHeight + topPadding + bottomPadding,
                        implicitBackgroundHeight, up.implicitIndicatorHeight,
                        down.implicitIndicatorHeight)

    padding: 3
    leftPadding: padding + (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
    rightPadding: padding + (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))
    property int indicatorHeight: (height - padding * 3) / 2
    Component.onCompleted: console.error("spinbox", indicatorHeight)

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    contentItem: LCDNumber {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: up.indicator.left
        digits: 2
        number: control.displayText
    }
    up.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width - padding
        anchors.top: control.top
        anchors.topMargin: padding
        height: indicatorHeight
        width: height
        implicitWidth: 40
        implicitHeight: 40
        color: control.up.pressed ? DPalette.shadow : DPalette.button
        border.color: "#80888888"
        radius: smallRadius

        Canvas {
            anchors.centerIn: parent
            width: parent.width - 15
            height: width
            contextType: "2d"
            Component.onCompleted: DPalette.onStyleChanged.connect(requestPaint)
            onPaint: {
                context.reset()
                context.strokeStyle = DPalette.text
                context.lineCap = "round"
                context.lineWidth = 1.5
                context.moveTo(width * 0.1, height * 0.75)
                context.lineTo(width / 2, height * 0.25)
                context.lineTo(width * 0.9, height * 0.75)
                context.stroke()
            }
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width - padding
        anchors.bottom: control.bottom
        anchors.bottomMargin: padding
        height: indicatorHeight
        width: height
        implicitWidth: 40
        implicitHeight: 40
        color: control.down.pressed ? DPalette.shadow : DPalette.button
        border.color: "#80888888"
        radius: smallRadius

        Canvas {
            anchors.centerIn: parent
            width: parent.width - 15
            height: width
            contextType: "2d"
            Component.onCompleted: DPalette.onStyleChanged.connect(requestPaint)
            onPaint: {
                context.reset()
                context.strokeStyle = DPalette.text
                context.lineCap = "round"
                context.lineWidth = 1.5
                context.moveTo(width * 0.1, height * 0.25)
                context.lineTo(width / 2, height * 0.75)
                context.lineTo(width * 0.9, height * 0.25)
                context.stroke()
            }
        }
    }

    background: Rectangle {
        implicitWidth: 140
        implicitHeight: 60
        radius: smallRadius
        color: enabled ? DPalette.mid : DPalette.base
        border.color: DPalette.button
    }
}
