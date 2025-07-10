import "../services/"
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects

Scope {
  id: root

  property string query: ""

  Loader {
    id: loader
    active: false
    onLoaded: root.query = ""

    sourceComponent: PanelWindow {
      id: window

      anchors.top: true
      margins.top: 20

      implicitWidth: 440
      implicitHeight: 72 * 5 + 56
      color: "transparent"

      Rectangle {
        id: rect
        anchors.fill: parent
        color: Style.colors.base01
        radius: Style.rounding.xlarge
        layer.enabled: true
      }

      ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Keys.onEscapePressed: loader.active = false
        layer.enabled: true
        layer.smooth: true

        layer.effect: MultiEffect {
          maskEnabled: true
          maskSource: rect
          maskThresholdMin: 0.5
          maskSpreadAtMin: 1
        }

        RowLayout {
          Layout.margins: 14
          spacing: 10

          IconImage {
            Layout.preferredWidth: 20
            Layout.preferredHeight: 20
            source: Quickshell.iconPath("search-symbolic")
          }

          M3TextField {
            Layout.fillWidth: true
            KeyNavigation.down: list
            focus: true
            placeholderText: "Search apps"
            onTextChanged: root.query = text

            onAccepted: {
              Apps.launch(list.currentItem.modelData)
              loader.active = false
            }
          }
        }

        Rectangle {
          Layout.fillWidth: true
          height: 1
          color: Style.colors.base03
        }

        ListView {
          id: list
          Layout.fillWidth: true
          Layout.fillHeight: true
          clip: true

          model: ScriptModel {
            values: Apps.fuzzyQuery(query)
            onValuesChanged: list.currentIndex = 0
          }

          delegate: M3ListItem {
            required property DesktopEntry modelData
            width: list.width

            icon {
              width: 40
              height: 40
              source: Quickshell.iconPath(modelData.icon, "image-missing")
            }

            text: modelData.name
            subtext: modelData.genericName || modelData.comment

            onClicked: {
              Apps.launch(modelData)
              loader.active = false
            }
          }
        }
      }

      HyprlandFocusGrab {
        active: loader.active
        windows: [ window ]
        onCleared: loader.active = false
      }
    }
  }

  GlobalShortcut {
    name: "launcherToggle"
    description: "Toggle launcher"
    onPressed: loader.active = !loader.active
  }
}
