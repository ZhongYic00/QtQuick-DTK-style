import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import singleton.dpalette 1.0

T.BusyIndicator {
    id: control
    implicitWidth: 64
    implicitHeight: 64
    property int dots: 6
    contentItem: Item {
        id: item
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        opacity: control.running ? 1 : 0

        Behavior on opacity {
            OpacityAnimator {
                duration: 250
            }
        }

        RotationAnimator {
            target: item
            running: control.visible && control.running
            from: 0
            to: 360
            loops: Animation.Infinite
            duration: 1250
        }

        Repeater {
            id: repeater
            model: control.dots

            Rectangle {
                x: item.width / 2 - width / 2
                y: item.height / 2 - height / 2
                implicitWidth: item.width / 5
                implicitHeight: implicitWidth
                radius: implicitWidth / 2
                color: DPalette.highlight
                transform: [
                    Translate {
                        y: -Math.min(item.width, item.height) * 0.5 + 5
                    },
                    Rotation {
                        angle: index / repeater.count * 360
                        origin.x: 5
                        origin.y: 5
                    }
                ]
            }
        }
    }
}
