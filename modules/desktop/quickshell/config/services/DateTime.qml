pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property string time: {
    Qt.formatTime(clock.date, "h:mm AP")
  }

  readonly property string date: {
    Qt.formatDate(clock.date, "ddd MMM d")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
