import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.15

T.ComboBox {
    id: control
    property int itemHeight: 0
    property bool blockHighlight: false
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

    DPalette {
        id: dpalette
    }
    delegate: ItemDelegate {
        width: ListView.view.width
        contentItem: Rectangle {
            anchors.fill: parent
            color: parent.highlighted ? dpalette.primary : "transparent"

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
                color: highlighted ? "white" : dpalette.buttonText
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }

            Component.onCompleted: {
                control.itemHeight = height
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
            target: dpalette
            function onStyleChanged() {
                canvas.requestPaint()
            }
        }

        onPaint: {
            context.reset()
            context.strokeStyle = dpalette.text
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
        color: dpalette.buttonText
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
        color: control.hovered ? dpalette.dark : dpalette.light
        border.color: dpalette.frameShadowBorder
        border.width: 2
    }

    popup: Popup {
        width: control.width
        implicitHeight: contentItem.implicitHeight + 2 * smallRadius
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            topMargin: smallRadius
            ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            radius: smallRadius
            color: dpalette.window
            anchors.fill: parent
            layer.enabled: true
            layer.effect: DropShadow {
                radius: 8
                samples: 17
                color: dpalette.shadow
                transparentBorder: true
            }
        }
        enter: Transition {
            NumberAnimation {
                property: "y"
                from: 0
                to: -(smallRadius + control.currentIndex * control.itemHeight)
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
        Timer {
            id: timer
        }
        onAboutToShow: {
            blockHighlight = true
            timer.interval = 200
            timer.repeat = false
            timer.triggered.connect(function () {
                blockHighlight = false
            })
            timer.start()
        }
    }
}
