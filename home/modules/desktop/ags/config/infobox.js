import GLib from "gi://GLib"

const battery = await Service.import("battery")
const datetime = Variable(GLib.DateTime.new_now_local(), {
  poll: [1000, () => GLib.DateTime.new_now_local()],
})

const clock = Widget.Box({
  class_name: "clock",
  vertical: true,
  spacing: 1,
  children: [
    Widget.Label({
      class_name: "time",
      label: datetime.bind().as(t => t.format("%I:%M")),
    }),
    Widget.Label({
      class_name: "date",
      label: datetime.bind().as(d => d.format("%a %b %e")),
    }),
  ],
})

const batterybar = Widget.LevelBar({
  class_name: "battery-level",
  visible: battery.bind("available"),
  widthRequest: 100,
  value: battery.bind("percent").as(p => p / 100),
})

export const InfoBox = Widget.Window({
  name: "infobox",
  class_name: "infobox",
  visible: false,
  anchor: ["bottom", "right"],
  layer: "overlay",
  child: Widget.Box({
    vertical: true,
    children: [ clock, batterybar ],
  }),
})
