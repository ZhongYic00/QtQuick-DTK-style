import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
import QtQuick.Templates 2.12 as T

T.TabBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    spacing: smallRadius
    DPalette {
        id: dpalette
    }

    contentItem: RowLayout {
        Component.onCompleted: console.error("row", width, height, x, y)

        Button {
            Layout.alignment: Qt.AlignLeft
            width: visible ? height : 0
            icon.name: "go-previous"
            enabled: view.contentX > view.originX
            visible: view.contentWidth > view.width
            Timer {
                id: timerL
                interval: 50
                repeat: true
                onTriggered: function () {
                    if (parent.pressed) {
                        view.moveViewContent(-30)
                    } else
                        timerL.stop()
                }
            }
            onPressed: timerL.start()
        }
        ListView {
            function moveViewContent(x) {
                view.contentX += x
                view.contentX = Math.min(
                            view.contentX,
                            view.originX + view.contentWidth - view.width)
                view.contentX = Math.max(view.contentX, view.originX)
            }
            id: view
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.minimumWidth: control.width - height * 2
            Layout.fillHeight: true
            model: control.contentModel
            currentIndex: control.currentIndex

            Component.onCompleted: console.error("listview", width,
                                                 height, x, y)
            spacing: control.spacing
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.AutoFlickIfNeeded
            //snapMode: ListView.SnapToItem
            clip: true

            highlightFollowsCurrentItem: true
            highlightMoveDuration: 1000
            highlightRangeMode: ListView.NoHighlightRange
            preferredHighlightBegin: 40
            preferredHighlightEnd: width - 40
            contentWidth: contentItem.childrenRect.width
            MouseArea {
                anchors.fill: parent
                onWheel: {
                    //                    console.error("view", parent.contentX, parent.contentWidth,
                    //                                  parent.width, parent.originX)
                    let scrollSpeed = 30
                    if (wheel.angleDelta.y > 0) {
                        decrementCurrentIndex()
                    } else {
                        incrementCurrentIndex()
                    }
                }
                onClicked: mouse.accepted = false
                onPressed: mouse.accepted = false
                onReleased: mouse.accepted = false
                onDoubleClicked: mouse.accepted = false
                onPositionChanged: mouse.accepted = false
                onPressAndHold: mouse.accepted = false
            }
        }
        Button {
            Layout.alignment: Qt.AlignRight
            width: visible ? height : 0
            icon.name: "go-next"
            enabled: view.contentX < view.originX + view.contentWidth - view.width
            visible: view.contentWidth > view.width
            Timer {
                id: timerR
                interval: 50
                repeat: true
                onTriggered: function () {
                    if (parent.pressed) {
                        view.moveViewContent(30)
                    } else
                        timerR.stop()
                }
            }
            onPressed: timerR.start()
        }
    }

    background: Rectangle {
        color: dpalette.base
    }
}
