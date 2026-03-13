import qs.services
import qs.modules.common
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
  id: root

  property bool showOsd: false

  Connections {
    target: Audio.sink?.audio

    function onVolumeChanged() {
      root.showOsd = true;
      timer.restart();
    }

    function onMutedChanged() {
      root.showOsd = true;
      timer.restart();
    }
  }

  Timer {
    id: timer
    interval: 1500
    onTriggered: root.showOsd = false
  }

  Loader {
    id: osdLoader
    active: root.showOsd

    sourceComponent: PanelWindow {
      anchors.bottom: true
      margins.bottom: 10
      exclusiveZone: 0

      implicitWidth: 200
      implicitHeight: 80
      color: "transparent"

      mask: Region {}

      Rectangle {
        anchors.fill: parent
        color: Style.colors.base00
        border.color: Style.colors.base02
        border.width: 1
      }

      ColumnLayout {
        anchors.centerIn: parent
        implicitWidth: parent.width - 32
        implicitHeight:parent.height - 32
        spacing: 16

        RowLayout {
          

          Text {
            font {
              family: Style.font
              pointSize: Style.fontSize.large
            }

            text: "Volume"
            color: Style.colors.base05
          }

          Rectangle {
            Layout.fillWidth: true
            color: "transparent"
          }

          Text {
            font {
              family: Style.font
              pointSize: Style.fontSize.large
            }

            text: Math.round(Audio.volume * 100)
            color: Style.colors.base05
          }
        }

        StyledProgressBar {
          value: Audio.volume

          activeColor: {
            Audio.muted ? Style.colors.base03 :
            Style.colors.base0D
          }
        }
      }
    }
  }
}
