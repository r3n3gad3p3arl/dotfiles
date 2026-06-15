pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
  id: root

  readonly property bool available: UPower.displayDevice.isLaptopBattery
  readonly property int chargeState: UPower.displayDevice.state
  readonly property bool isCharging: chargeState == UPowerDeviceState.Charging
  readonly property real percentage: UPower.displayDevice.percentage
  readonly property bool isLow: percentage <= 0.15
}
