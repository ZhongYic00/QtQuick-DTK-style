import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import singleton.dpalette 1.0

T.Switch {
    id: control
    width: 50
    height: 24

    indicator: Rectangle {
        width: parent.width
        height: parent.height
        x: parent.leftPadding
        y: parent.height / 2 - height / 2
        radius: smallRadius
        color: DPalette.dark
        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: 30
            height: parent.height
            radius: smallRadius - 1
            color: control.checked ? DPalette.highlight : DPalette.buttonText
            Behavior on x {
                NumberAnimation {
                    //This specifies how long the animation takes
                    duration: 300
                    //This selects an easing curve to interpolate with, the default is Easing.Linear
                    easing.type: Easing.OutCubic
                }
            }
            Behavior on color {
                ColorAnimation {
                    duration: 200
                    easing.type: Easing.OutExpo
                }
            }
        }
    }
}
