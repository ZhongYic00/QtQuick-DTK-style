import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import DPalette 1.0

//import DGui 1.0
ApplicationWindow {
    //    //    property int smallRadius: 8
    //    //    property int bigRadius: 18
    //    property color primaryColor: DPalette.highlight
    //    id: rectangle
    //    Rectangle {
    //        color: DPalette.button
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
    titlebarContent: TextField {
        width: Math.min(parent.width, 350)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    TextField {
        id: numInput
        text: "0"
        color: acceptableInput ? DPalette.text : DPalette.textWarning
        validator: IntValidator {
            bottom: 0
            top: 100
        }
    }
    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        //        Image {
        //            source: "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wyU9?ver=cd9e"
        //            width: parent.width
        //            height: parent.height
        //        }
        RoundButton {}

        Row {
            spacing: bigRadius
            Button {
                text: qsTr('normal')
            }

            Button {
                text: qsTr('highlighted')
                highlighted: true
            }

            Button {
                id: button
                text: qsTr('flat')
                flat: true
            }
            Button {
                text: qsTr('highlighted&&flat')
                highlighted: true
                flat: true
            }
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
                    color: DPalette.text
                }
                Switch {}
            }
        }
        Pane {
            radius: bigRadius
            verticalPadding: smallRadius / 2
            RowLayout {
                RadioButton {
                    color: DPalette.button
                }
                RadioButton {
                    color: DPalette.dark
                }
                RadioButton {
                    color: DPalette.light
                }
                RadioButton {
                    color: DPalette.mid
                }
                RadioButton {
                    color: DPalette.midlight
                }
                RadioButton {
                    color: DPalette.shadow
                }
                RadioButton {
                    color: DPalette.window
                }
                RadioButton {
                    color: DPalette.windowText
                }
                RadioButton {
                    color: DPalette.textWarning
                }
                RadioButton {
                    color: DPalette.obviousBackground
                }
                RadioButton {
                    color: DPalette.frameShadowBorder
                }
                RadioButton {
                    color: DPalette.textTips
                }
                RadioButton {
                    color: DPalette.textTitle
                }
                RadioButton {
                    color: DPalette.placeholderText
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
            Layout.preferredWidth: parent.width
        }
        TextField {
            placeholderText: "0ssssssssssssssss0"
            ToolTip.text: "test tip"
            ToolTip.visible: hovered
        }
        Label {
            text: qsTr("hello")
            color: DPalette.windowText
            //palette: DPalette
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
    //            border.color: checkbox.down ? DPalette.lightLively : DPalette.midlight

    //            Rectangle {
    //                width: 14
    //                height: 14
    //                x: 6
    //                y: 6
    //                radius: 2
    //                color: checkbox.down ? DPalette.lightLively : DPalette.midlight
    //                visible: checkbox.checked
    //            }
    //        }

    //        contentItem: Text {
    //            text: checkbox.text
    //            font: checkbox.font
    //            opacity: enabled ? 1.0 : 0.3
    //            color: checkbox.down ? DPalette.darkLively : DPalette.lightLively
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
    //                color: DPalette.shadow
    //                border.color: DPalette.dark
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
