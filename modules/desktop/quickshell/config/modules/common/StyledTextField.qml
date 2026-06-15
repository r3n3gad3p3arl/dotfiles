import qs.services
import QtQuick
import QtQuick.Controls

TextField {
  font {
    family: Style.font
    pointSize: Style.fontSize.medium
  }

  cursorDelegate: Rectangle {
    width: 1
    radius: 1
    color: parent.activeFocus ? Style.colors.base03 : "transparent"
  }

  color: Style.colors.base05
  placeholderTextColor: Style.colors.base03
  background: null
}
