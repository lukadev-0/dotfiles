pragma Singleton

import Quickshell
import Quickshell.Io
import QtCore

Singleton {
    FileView {
        id: colorsJson
        path: StandardPaths.writableLocation(StandardPaths.ConfigLocation) + "/colors.json"
        blockLoading: true
    }

    readonly property var colors: JSON.parse(colorsJson.text())
}
