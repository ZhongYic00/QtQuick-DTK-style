import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import singleton.dpalette 1.0

T.ApplicationWindow {
    id: window

    visible: true

    color: DPalette.window

    overlay.modal: Rectangle {
        color: Color.transparent(DPalette.shadow, 0.5)
    }

    overlay.modeless: Rectangle {
        color: Color.transparent(DPalette.shadow, 0.12)
    }
    onActiveChanged: console.warn("active", active)
}
