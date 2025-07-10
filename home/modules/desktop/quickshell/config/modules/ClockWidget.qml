import "../services/"
import QtQuick
import QtQuick.Layouts

RowLayout {
  Text {
    Layout.fillWidth: true

    font {
      family: Style.font
      pointSize: Style.fontSize.large
    }

    text: DateTime.time
    color: Style.colors.base05
  }

  Text {
    font {
      family: Style.font
      pointSize: Style.fontSize.small
    }

    text: DateTime.date
    color: Style.colors.base03
  }
}

