import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15

//import DGui 1.0
Rectangle {
    color: dpalette.base
    SystemPalette {
        id: dpalette
        colorGroup: SystemPalette.Active
        property color lightLively: Qt.lighter(highlight, 4 / 3)
        property color darkLively: Qt.lighter(highlight, 11 / 10)
        property color textWarning: Qt.darker(highlight, 10 / 9)
    }
    //    //    property int smallRadius: 8
    //    //    property int bigRadius: 18
    //    property color primaryColor: dpalette.highlight
    //    id: rectangle
    //    Rectangle {
    //        color: dpalette.button
    //        height: 200
    //        width: height
    //        anchors.bottom: parent.bottom
    //        anchors.horizontalCenter: parent.horizontalCenter

    //        Rectangle {
    //            id: sub
    //            height: 100
    //            width: height
    //            anchors.centerIn: parent
    //        }

    //        InnerShadow {
    //            anchors.fill: sub
    //            radius: 20
    //            samples: 40
    //            spread: 0.5
    //            source: sub
    //            color: "#80000000"
    //        }
    //    }

    //    Text {
    //        id: hello_world
    //        text: qsTr("hello world")
    //        anchors.centerIn: parent
    //    }
    //    TextField {
    //        id: widthInput
    //        text: progressbar.visualPosition
    //        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    //        Layout.margins: 5
    //    }
    TextField {
        id: numInput
        text: "0"
    }
    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        RoundButton {}

        Button {
            id: button
            text: qsTr("button")
            //            onClicked: popup.open()
        }
        Switch {}

        BusyIndicator {
            id: busy
        }
        ProgressBar {
            id: progressbar
            value: 0.3
            x: 200
            width: 300
            thin: true
        }
        ProgressBar {
            value: 0.5
            x: 200
            width: 300
            padding: 1.5
            thin: false
        }
        Slider {
            width: 300
            value: 0.3
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
        }
        SpinBox {}
        Pane {
            width: 300
            radius: smallRadius
            Component.onCompleted: console.error("pane", width, height)
            RowLayout {
                Text {
                    text: qsTr("窗口特效")
                    color: dpalette.text
                }
                Switch {}
            }
        }
        Pane {
            radius: bigRadius
            verticalPadding: smallRadius / 2
            RowLayout {
                RadioButton {
                    color: dpalette.button
                }
                RadioButton {
                    color: dpalette.dark
                }
                RadioButton {
                    color: dpalette.light
                }
                RadioButton {
                    color: dpalette.mid
                }
                RadioButton {
                    color: dpalette.midlight
                }
                RadioButton {
                    color: dpalette.shadow
                }
                RadioButton {
                    color: dpalette.window
                }
                RadioButton {
                    color: dpalette.windowText
                }
                RadioButton {
                    color: dpalette.textWarning
                }
                RadioButton {
                    color: dpalette.obviousBackgRadio
                }
                RadioButton {
                    color: dpalette.frameShadowBorder
                }
                RadioButton {
                    color: dpalette.textTips
                }
                RadioButton {
                    color: dpalette.textTitle
                }
                RadioButton {
                    color: dpalette.placeholderText
                }
                anchors.centerIn: parent
            }
        }
        Pane {
            Layout.fillWidth: true
            RowLayout {
                ComboBox {
                    id: combo
                    model: ["First", "Second", "Third", "4", "5", "666666666666666666666666666", "7", "First", "Second", "Third", "4", "5", "666666666666666666666666666", "7", "First"]
                    Layout.preferredWidth: parent.parent.width / 2
                    Layout.alignment: Qt.AlignRight
                }
                //                ComboBox {
                //                    id: combo1
                //                    model: ["First", "Second", "Third", "4", "5"]
                //                    Layout.preferredWidth: parent.parent.width / 2
                //                    Layout.alignment: Qt.AlignRight
                //                }
                Layout.alignment: Qt.AlignRight
            }
        }
        TabBar {
            height: 24
            Layout.fillWidth: true
            Component.onCompleted: console.error("tabbar", width)
            TabButton {
                text: qsTr("Home")
            }
            TabButton {
                text: qsTr("Discover")
            }
            TabButton {
                text: qsTr("Activity")
            }
            TabButton {
                text: qsTr("Home")
            }
            TabButton {
                text: qsTr("Discover")
            }
            TabButton {
                text: qsTr("Activity")
            }
            TabButton {
                text: qsTr("Homeeeeeeeeeeeeeeeeee")
            }
            TabButton {
                text: qsTr("Discover")
            }
            TabButton {
                text: qsTr("Activity")
            }
            TabButton {
                text: qsTr("Home")
            }
            TabButton {
                text: qsTr("Discover")
            }
            TabButton {
                text: qsTr("Activity")
            }
            Layout.preferredWidth: parent.width
        }
        TextField {
            placeholderText: "0ssssssssssssssss0"
            ToolTip.text: "test tip"
            ToolTip.visible: hovered
        }
        Label {
            text: qsTr("hello")
            color: dpalette.windowText
            //palette: dpalette
        }
        Dial {}
    }

    //    CheckBox {
    //        id: checkbox
    //        text: qsTr("CheckBox")
    //        checked: true

    //        anchors.top: swtch.bottom

    //        indicator: Rectangle {
    //            implicitWidth: 26
    //            implicitHeight: 26
    //            x: parent.leftPadding
    //            y: parent.height / 2 - height / 2
    //            radius: 3
    //            border.color: checkbox.down ? dpalette.lightLively : dpalette.midlight

    //            Rectangle {
    //                width: 14
    //                height: 14
    //                x: 6
    //                y: 6
    //                radius: 2
    //                color: checkbox.down ? dpalette.lightLively : dpalette.midlight
    //                visible: checkbox.checked
    //            }
    //        }

    //        contentItem: Text {
    //            text: checkbox.text
    //            font: checkbox.font
    //            opacity: enabled ? 1.0 : 0.3
    //            color: checkbox.down ? dpalette.darkLively : dpalette.lightLively
    //            verticalAlignment: Text.AlignVCenter
    //            leftPadding: checkbox.indicator.width + checkbox.spacing
    //        }
    //    }
    //        Popup {
    //            id: popup
    //            implicitWidth: 200
    //            implicitHeight: 200
    //            parent: Overlay.overlay
    //            background: Rectangle {
    //                id: popupBg
    //                anchors.centerIn: parent.center
    //                implicitWidth: 200
    //                implicitHeight: 200
    //                radius: bigRadius
    //                color: dpalette.shadow
    //                border.color: dpalette.dark
    //                border.width: 1
    //                layer.enabled: true
    //                layer.effect: GaussianBlur {
    //                    anchors.fill: parent
    //                    radius: 8
    //                    samples: 16
    //                }
    //            }
    //        }
    //    MouseArea {
    //        anchors.fill: parent
    //        onClicked: popup.visible = true
    //        enabled: false
    //    }
}
