import qs.services
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

StyledButton {
  id: root
  implicitHeight: 72
  width: parent.width
  backgroundColor: "transparent"
  backgroundFocusedColor: Style.colors.base02
  textColor: Style.colors.base05
  spacing: 16
  outlineOnFocus: false

  icon {
    width: 24
    height: 24
  }

  property string subtext: ""
  property color subtextColor: Style.colors.base03

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

    ColumnLayout {
      Text {
        Layout.fillWidth: true
        text: root.text
        font: root.font
        color: textColor
      }

      Text {
        Layout.fillWidth: true
        visible: root.subtext !== ""
        text: root.subtext
        font.family: root.font.family
        font.pointSize: Style.fontSize.small
        elide: Text.ElideRight
        color: subtextColor
      }
    }
  }
}
