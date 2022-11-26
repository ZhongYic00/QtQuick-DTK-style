import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.15
import DPalette 1.0

T.ComboBox {
    id: control
    property int itemHeight: height
    property bool blockHighlight: false
    property int windowHeight: 800
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        implicitContentHeight + topPadding + bottomPadding,
                        implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!control.mirrored || !indicator
                            || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator
                             || !indicator.visible ? 0 : indicator.width + spacing)

    delegate: ItemDelegate {
        width: ListView.view.width
        contentItem: Rectangle {
            anchors.fill: parent
            color: parent.highlighted ? DPalette.highlight : "transparent"

            Image {
                id: img
                x: (parent.width - width) / 2
                y: (parent.height - height) / 2
                source: "qrc:/qt-project.org/imports/QtQuick/Controls.2/images/check.png"
                visible: index === control.currentIndex
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                width: control.width - img.width
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: img.width
                text: modelData
                color: highlighted ? "white" : DPalette.buttonText
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }

            Component.onCompleted: {
                //control.itemHeight = height
                height = control.itemHeight
                console.error("itemHeight", control.itemHeight)
            }
        }
        highlighted: (blockHighlight ? control.currentIndex : control.highlightedIndex) === index
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() {
                canvas.requestPaint()
            }
        }
        Connections {
            target: DPalette
            function onStyleChanged() {
                canvas.requestPaint()
            }
        }

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

    contentItem: Text {
        leftPadding: smallRadius
        rightPadding: control.indicator.width + control.spacing
        text: control.displayText
        font: control.font
        color: DPalette.buttonText
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        // was Item
        id: bg
        implicitWidth: 120
        implicitHeight: 40
        anchors.fill: parent
        radius: smallRadius
        color: control.hovered ? DPalette.dark : DPalette.light
        border.color: DPalette.dark
        border.width: 2
    }

    popup: T.Popup {
        id: popup
        width: control.width
        height: Math.min(contentItem.implicitHeight + 2 * smallRadius,
                         control.Window.height - topMargin - bottomMargin)
        padding: 0
        topMargin: 6
        bottomMargin: topMargin

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            height: Math.min(contentHeight, popup.height - 2 * smallRadius)
            y: (popup.height - height) / 2
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            topMargin: smallRadius
            ScrollIndicator.vertical: ScrollIndicator {}
        }

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
        property bool transEnabled: mapFromGlobal(0, control.Window.height).y
                                    - popup.bottomMargin - height >= -smallRadius
                                    && mapFromGlobal(
                                        0,
                                        0).y + topMargin <= -height + smallRadius
        enter: Transition {
            NumberAnimation {
                property: "y"
                from: popup.transEnabled ? 0 : mapFromGlobal(
                                               0, control.Window.height).y
                                           - popup.bottomMargin - height
                to: popup.transEnabled ? (control.Window.height - popup.topMargin - popup.bottomMargin > height) ? Math.min(Math.max(-(smallRadius + control.currentIndex * control.itemHeight), mapFromGlobal(0, 0).y + popup.topMargin), mapFromGlobal(0, control.Window.height).y - popup.bottomMargin - height) : Math.min(Math.max(0, mapFromGlobal(0, 0).y + popup.topMargin), mapFromGlobal(0, control.Window.height).y - popup.bottomMargin - height) : 0
                duration: 200
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
            }
        }
        Timer {
            id: timer
        }
        onAboutToShow: {
            timer.interval = 200
            timer.repeat = false
            timer.triggered.connect(function () {
                blockHighlight = false
                //                console.error(
                //                            "from", mapFromGlobal(
                //                                0,
                //                                control.Window.height).y - bottomMargin - height)
                //                console.error(
                //                            "to", control.Window.height
                //                            - popup.topMargin - popup.bottomMargin > height, y,
                //                            (control.Window.height - popup.topMargin
                //                             - popup.bottomMargin > height) ? Math.min(
                //                                                                  Math.max(-(smallRadius + control.currentIndex * control.itemHeight), mapFromGlobal(0, 0).y + popup.topMargin), mapFromGlobal(0, control.Window.height).y - popup.bottomMargin - height) : 0)
            })
            if (transEnabled) {
                blockHighlight = true
                timer.start()
            }
        }
    }
}
