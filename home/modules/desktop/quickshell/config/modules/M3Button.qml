import "../services/"
import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Button {
  id: root
  implicitHeight: 40
  horizontalPadding: 16
  spacing: 8
  Keys.onReturnPressed: root.animateClick()

  icon {
    width: 20
    height: 20
  }

  font {
    family: Style.font
    pointSize: Style.fontSize.medium
  }

  property color backgroundColor: Style.colors.base0D
  property color backgroundFocusedColor: backgroundColor
  property color textColor: Style.colors.base01
  property real radius: Style.rounding.full
  property bool outlineOnFocus: true

  background: Item {
    id: background

    Rectangle {
      implicitHeight: parent.height
      implicitWidth: parent.width
      color: root.activeFocus ? backgroundFocusedColor : backgroundColor
      radius: root.radius
    }

    Loader {
      anchors.centerIn: parent
      active: root.activeFocus && outlineOnFocus

      sourceComponent: Rectangle {
        implicitHeight: background.height + 10
        implicitWidth: background.width + 10
        color: "transparent"
        radius: root.radius

        border {
          color: backgroundFocusedColor
          width: 3
        }
      }
    }
  }

  contentItem: RowLayout {
    spacing: iconLoader.active ? root.spacing : 0

    Loader {
      id: iconLoader
      active: root.icon.name !== "" || root.icon.source.toString() !== ""

      sourceComponent: IconImage {
        width: root.icon.width
        height: root.icon.height
        source: root.icon.source
      }
    }

    Text {
      Layout.fillWidth: true
      font: root.font 
      color: textColor
      text: root.text
    }
  }
}
