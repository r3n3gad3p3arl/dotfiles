pragma Singleton

import QtCore
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  readonly property string font: "Inter"

  readonly property QtObject fontSize: QtObject {
    property int small: 10
    property int medium: 12
    property int large: 14
  }

  readonly property var colors: {
    JSON.parse(colorsJson.text())
  }

  readonly property QtObject rounding: QtObject {
    property int medium: 12
    property int large: 16
    property int xlarge: 28
    property int full: 9999
  }

  FileView {
    id: colorsJson
    path: `${StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0]}/quickshell/colors.json`
    watchChanges: true
    onFileChanged: this.reload()
    blockLoading: true
  }
}

