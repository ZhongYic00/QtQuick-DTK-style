import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
import QtQuick.Templates 2.12 as T
import singleton.dpalette 1.0

T.TabBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    spacing: smallRadius
    property bool isScrollEnabled: true
    function isViewFitIn() {
        return view.contentWidth > control.width
    }

    contentItem: Item {
        anchors.fill: parent

        //        Component.onCompleted: console.log("TabBar", width, height, x, y)
        Button {
            id: leftButton
            anchors.left: parent.left
            width: visible ? height : 0
            icon.name: "go-previous"
            enabled: view.contentX > view.originX
            visible: view.contentWidth > control.width
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
            height: parent.height
            anchors.left: leftButton.right
            anchors.right: rightButton.left
            anchors.leftMargin: spacing
            anchors.rightMargin: spacing
            model: control.contentModel
            currentIndex: control.currentIndex
            implicitWidth: contentWidth

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
            contentWidth: contentItem.childrenRect.width
            MouseArea {
                anchors.fill: parent
                enabled: control.isScrollEnabled
                onWheel: {
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
            id: rightButton
            anchors.right: parent.right
            width: visible ? height : 0
            icon.name: "go-next"
            enabled: view.contentX < view.originX + view.contentWidth - view.width
            visible: view.contentWidth > control.width
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
        color: "transparent"
    }
}
