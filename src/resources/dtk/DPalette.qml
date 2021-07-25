import QtQuick 2.15

SystemPalette {
    colorGroup: switch (globalColorGroup) {
                case "Disabled":
                    SystemPalette.Disabled
                    break
                case "Inactive":
                    SystemPalette.Inactive
                    break
                case "NColorGroups":
                case "Current":
                case "All":
                case "Normal":
                case "Active":
                    SystemPalette.Active
                    break
                }
    onObviousBackgroundChanged: console.error(dpaletteLightStyle,
                                              globalColorGroup)
    property color lightLively: Qt.lighter(highlight, 4 / 3)
    property color darkLively: Qt.lighter(highlight, 11 / 10)
    property color textWarning: Qt.darker(highlight, 10 / 9)
    property color obviousBackground: Qt.rgba(!dpaletteLightStyle,
                                              !dpaletteLightStyle,
                                              !dpaletteLightStyle, .1)
    property color itemBackground: dpaletteLightStyle ? Qt.rgba(0, 0, 0,
                                                                0.03) : Qt.rgba(
                                                            1, 1, 1, .05)
    property color frameBorder: dpaletteLightStyle ? Qt.rgba(0, 0, 0,
                                                             0.05) : Qt.rgba(
                                                         1, 1, 1, .05)
    property color frameShadowBorder: dpaletteLightStyle ? obviousBackground : Qt.rgba(
                                                               0, 0, 0, .08)
    property color placeholderText: dpaletteLightStyle ? Qt.rgba(
                                                             1 / 3, 1 / 3,
                                                             1 / 3,
                                                             .4) : Qt.rgba(192 / 255, 198 / 255, 212 / 255, .4)
    property color textTitle: dpaletteLightStyle ? "#001A2E" : "#C0C6D4"
    property color textTips: dpaletteLightStyle ? "#526A7F" : "#6D7C88"
    property color textLively: "white"
    property color primary: highlight
    signal styleChanged
    onBaseChanged: styleChanged()
}
