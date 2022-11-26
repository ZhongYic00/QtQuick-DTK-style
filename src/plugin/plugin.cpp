#include "plugin.hpp"

void qml_register_types_DPalette();

Plugin::Plugin(QObject *parent) : QQmlEngineExtensionPlugin { parent } {
    volatile auto registration = &qml_register_types_DPalette;
    Q_UNUSED(registration);
}