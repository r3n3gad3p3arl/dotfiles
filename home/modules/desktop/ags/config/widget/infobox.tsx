import { Variable, GLib, bind } from "astal"
import { App, Astal } from "astal/gtk3"
import Battery from "gi://AstalBattery"

function Clock({ timeformat = "%I:%M", dateformat = "%a %b %e" }) {
  const dt = Variable(GLib.DateTime.new_now_local()).poll(1000, () =>
    GLib.DateTime.new_now_local())

  const time = dt(t => t.format(timeformat)!)
  const date = dt(d => d.format(dateformat)!)

  return <box
    className="clock"
    vertical
    spacing={1}
    onDestroy={() => dt.drop()}>
      <label
        className="time"
        label={time}
      />
      <label
        className="date"
        label={date}
      />
  </box>
}

function BatteryLevel() {
  const bat = Battery.get_default()

  return <levelbar
    className="battery-level"
    visible={bind(bat, "isPresent")}
    widthRequest={100}
    value={bind(bat, "percentage")}
  />
}

export default function InfoBox() {
  return <window
    name="infobox"
    className="infobox"
    application={App}
    visible={false}
    anchor={Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.RIGHT}
    layer={Astal.Layer.OVERLAY}>
      <box vertical>
        <Clock />
        <BatteryLevel />
      </box>
  </window>
}
