import qs.services
import qs.modules.common
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Scope {
  Loader {
    id: loader
    active: false

    sourceComponent: PanelWindow {
      anchors {
        bottom: true
        right: true
      }

      margins {
        bottom: 10
        right: 10
      }

      implicitHeight: 80
      implicitWidth: 240
      color: "transparent"

      Rectangle {
        anchors.fill: parent
        color: Style.colors.base00
        border.color: Style.colors.base02
        border.width: 1
      }

      ColumnLayout {
        anchors.centerIn: parent
        implicitWidth: parent.width - 32
        implicitHeight: parent.height - 32
        spacing: 16

        ClockWidget {}

        StyledProgressBar {
          visible: Battery.available
          value: Battery.percentage

          activeColor: {
            Battery.isCharging ? Style.colors.base0B :
            Battery.isLow ? Style.colors.base08 :
            Style.colors.base0D
          }
        }
      }
    }
  }

  GlobalShortcut {
    name: "infoBoxToggle"
    description: "Toggle info box"
    onPressed: loader.active = !loader.active
  }
}
