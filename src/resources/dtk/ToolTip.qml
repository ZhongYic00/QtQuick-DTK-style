import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.15

T.ToolTip {
    id: control

    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: (parent ? parent.height : 0) + 3

    implicitWidth: Math.min(
                       Math.max(
                           implicitBackgroundWidth + leftInset + rightInset,
                           contentWidth + leftPadding + rightPadding),
                       parent ? parent.width : 10000)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    margins: 6
    padding: 6

    DPalette {
        id: dpalette
    }

    closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent
                 | T.Popup.CloseOnReleaseOutsideParent

    contentItem: Text {
        font: control.font
        width: Math.min(
                   implicitWidth,
                   control.width - control.leftPadding - control.rightPadding)
        //        TextMetrics {
        //            id: metrics
        //            text: control.text
        //            elide: Text.ElideMiddle
        //            elideWidth: Math.min(
        //                            contentWidth,
        //                            control.width - control.leftPadding - control.rightPadding)
        //            onElideWidthChanged: console.error("elideWidth", elideWidth)
        //        }
        text: control.text
        elide: Text.ElideRight
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        //        maximumLineCount: 3
        color: dpalette.text
        onWidthChanged: ; /*console.error(control.parent, "width", width,
                                              implicitWidth, contentWidth,
                                                                                    control.width)*/
    }

    background: Rectangle {
        radius: smallRadius
        border.color: dpalette.dark
        color: dpalette.base
        layer.enabled: true
        layer.effect: DropShadow {
            color: dpalette.shadow
            verticalOffset: 0
            radius: 8
            samples: 17
        }
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
