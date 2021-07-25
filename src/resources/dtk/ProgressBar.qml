import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.15

T.ProgressBar {
    id: control
    property bool thin: false
    property int radius: thin ? 5 : smallRadius
    padding: 2
    height: radius * (thin ? 2 : 3)
    implicitWidth: 200
    Component.onCompleted: console.error(height)
    DPalette {
        id: dpalette
    }
    NumberAnimation on value {
        from: 0
        to: control.value
        duration: 10000
        running: true
    }

    background: Rectangle {
        implicitWidth: 200
        height: parent.height
        color: dpalette.dark
        radius: control.radius
    }

    contentItem: Rectangle {
        height: parent.height
        width: parent.width * parent.visualPosition
        radius: control.radius
        color: Qt.rgba(1, 0, 0, 1)
        clip: true

        Rectangle {
            width: parent.width
            height: parent.height
            radius: control.radius
            clip: true
            color: dpalette.primary
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop {
                    position: 0.0
                    color: dpalette.darkLively
                }
                GradientStop {
                    position: 1.0
                    color: dpalette.lightLively
                }
            }
        }
        Rectangle {
            height: parent.height
            color: dpalette.primary
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop {
                    position: 0.0
                    color: Qt.rgba(1, 1, 1, 0)
                }
                GradientStop {
                    position: 0.7
                    color: Qt.rgba(1, 1, 1, 0.3)
                }
                GradientStop {
                    position: 1.0
                    color: Qt.rgba(1, 1, 1, 0)
                }
            }
            NumberAnimation on width {
                loops: Animation.Infinite
                from: 0
                to: control.width
                duration: 1500
            }
        }
    }
}
