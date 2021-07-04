import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T

T.Slider {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitHandleHeight + topPadding + bottomPadding)

    padding: 6
    DPalette {
        id: dpalette
    }
    property double backgroundDotWidth: 2
    property double backgroundDotSpacing: 1
    property int segs: width / (backgroundDotSpacing + backgroundDotWidth)

    handle: Rectangle {
        x: control.leftPadding
           + (control.horizontal ? control.visualPosition * control.availableWidth - width
                                   / 2 : (control.availableWidth - width) / 2)
        y: control.topPadding
           + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition
                                   * (control.availableHeight - height))
        implicitWidth: 22
        implicitHeight: 26
        radius: smallRadius
        color: control.pressed ? dpalette.lightLively : dpalette.primary
    }

    background: Row {
        spacing: backgroundDotSpacing
        height: backgroundDotWidth * 2
        width: segs * (backgroundDotSpacing + backgroundDotWidth) - backgroundDotSpacing
        anchors.verticalCenter: control.verticalCenter
        Repeater {
            model: segs
            //            Component.onCompleted: console.error("slider", parent.width, model,
            //                                                 parent.height)
            Rectangle {
                width: backgroundDotWidth
                height: width * 2
                color: (index < control.value * segs) ? dpalette.primary : dpalette.button
                radius: 1
                //                Component.onCompleted: console.error("slider", index, segs,
                //                                                     index / parent.count)
            }
        }
    }
}
