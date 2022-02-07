import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Layouts 1.12
import singleton.dpalette 1.0

T.Pane {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)
    property int radius: smallRadius

    padding: radius

    background: Rectangle {
        radius: control.radius
        color: DPalette.itemBackground
    }
}
