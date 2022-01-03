import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T

T.Switch {
    id: control
    width: 50
    height: 24
    DPalette {
        id: dpalette
    }
    indicator: Rectangle {
        width: parent.width
        height: parent.height
        x: parent.leftPadding
        y: parent.height / 2 - height / 2
        radius: smallRadius
        color: dpalette.dark
        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: 30
            height: parent.height
            radius: smallRadius - 1
            color: control.checked ? dpalette.highlight : dpalette.buttonText
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
