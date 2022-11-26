import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
import QtQuick.Templates 2.12 as T
import DPalette 1.0

T.ApplicationWindow {
    id: window

    visible: true

    flags: Qt.Window | Qt.CustomizeWindowHint

    color: Qt.rgba(0, 0, 0, 0)

    Binding {
        target: DPalette
        property: "active"
        value: active
    }

    contentItem.clip: true
    minimumWidth: titlebar.implicitWidth
    width: minimumWidth
    minimumHeight: titlebar.height + bigRadius + 200
    height: minimumHeight

    header: Item {
        height: titlebar.height
        width: parent.width
    }
    footer: Item {
        height: bigRadius
        width: parent.width
    }
    property var titlebarContent: Item {}

    //    Component.onCompleted: {
    //        console.warn("titlebar", titlebar, titlebar.height, contentItem,
    //                     contentItem.y, contentItem.height, width, height)
    //    }
    background: Rectangle {
        anchors.fill: parent
        radius: bigRadius
        clip: true
        MouseArea {
            id: resizeareaRB
            width: bigRadius
            height: bigRadius
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            cursorShape: Qt.SizeFDiagCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 100
            onPressAndHold: {
                window.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
            }
        }
        MouseArea {
            id: resizeareaLB
            width: bigRadius
            height: bigRadius
            anchors.bottom: parent.bottom
            anchors.right: parent.left

            cursorShape: Qt.SizeBDiagCursor
            acceptedButtons: Qt.LeftButton
            pressAndHoldInterval: 100
            onPressAndHold: {
                window.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
            }
        }
        Rectangle {
            radius: window.visibility == Window.Maximized ? 0 : bigRadius
            color: DPalette.window
            anchors.fill: parent
        }
        Rectangle {
            id: titlebar
            height: 50
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            implicitWidth: applicationIcon.width + 3 * 50 + height
            color: DPalette.base
            radius: window.visibility == Window.Maximized ? 0 : bigRadius
            Rectangle {
                height: parent.height - bigRadius
                color: parent.color
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.DragMoveCursor
                onDoubleClicked: {
                    if (window.visibility == Window.Maximized)
                        window.showNormal()
                    else
                        window.showMaximized()
                }
                pressAndHoldInterval: 100
                onPressAndHold: {
                    window.startSystemMove()
                }
            }
            Item {
                id: applicationIcon
                anchors.left: parent.left
                height: parent.height
                width: height
                IconImage {
                    name: "deepin-terminal"
                    height: 32
                    width: 32
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Item {
                id: titlebarContentArea
                anchors.left: applicationIcon.right
                anchors.right: buttonBox.left
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height
                children: titlebarContent
                clip: true
            }
            Row {
                id: buttonBox
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                Button {
                    height: parent.height
                    width: height
                    icon.name: "application-menu"
                    icon.height: 32
                    icon.width: 32
                    flat: true
                    onReleased: {
                        applicationMenu.popup(0, height)
                    }
                    Menu {
                        id: applicationMenu
                        Action {
                            text: qsTr('About')
                        }
                        MenuSeparator {}
                        Menu {
                            title: qsTr('Theme')
                            Action {
                                text: qsTr('light')
                                onTriggered: DPalette.changeApplicationTheme(
                                                 DPalette.Light)
                            }
                            Action {
                                text: qsTr('dark')
                                onTriggered: DPalette.changeApplicationTheme(
                                                 DPalette.Dark)
                            }
                            Action {
                                text: qsTr('system')
                                onTriggered: DPalette.changeApplicationTheme(
                                                 DPalette.System)
                            }
                        }
                        Action {
                            text: qsTr('Quit')
                            onTriggered: window.close()
                        }
                    }
                }
                Button {
                    height: parent.height
                    width: height
                    icon.name: "window-minimize"
                    icon.height: 32
                    icon.width: 32
                    flat: true
                    onReleased: window.showMinimized()
                }
                Button {
                    height: parent.height
                    width: height
                    icon.name: window.visibility
                               == Window.Maximized ? "window-normalize" : "window-maximize"
                    icon.height: 32
                    icon.width: 32
                    flat: true
                    onReleased: window.visibility
                                == Window.Maximized ? window.showNormal(
                                                          ) : window.showMaximized()
                }
                Button {
                    height: parent.height
                    width: height
                    icon.name: "window-close"
                    icon.height: 32
                    icon.width: 32
                    flat: true
                    onReleased: window.close()
                }
            }
        }
    }

    overlay.modal: Rectangle {
        color: Color.transparent(DPalette.shadow, 0.5)
    }

    overlay.modeless: Rectangle {
        color: Color.transparent(DPalette.shadow, 0.12)
    }
}
