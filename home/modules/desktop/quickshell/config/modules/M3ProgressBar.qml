import "../services/"
import QtQuick
import QtQuick.Controls

ProgressBar {
  id: root
  width: parent.width
  height: 4

  property color trackColor: Style.colors.base02
  property color activeColor: Style.colors.base0D
  property real gap: 4

  background: Item {
    implicitHeight: root.height
    implicitWidth: root.width
  }

  contentItem: Item {
    implicitHeight: root.height
    implicitWidth: root.width

    Rectangle {
      width: root.visualPosition * parent.width
      height: parent.height
      radius: Style.rounding.full
      color: activeColor
    }

    Rectangle {
      anchors.right: parent.right
      width: (1 - root.visualPosition) * parent.width - gap
      height: parent.height
      radius: Style.rounding.full
      color: trackColor
    }

    Rectangle {
      anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: parent.height / gap
      }

      width: gap
      height: gap
      radius: Style.rounding.full
      color: activeColor
    }
  }
}
