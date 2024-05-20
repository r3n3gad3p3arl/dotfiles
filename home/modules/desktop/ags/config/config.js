import GLib from "gi://GLib"

const battery = await Service.import("battery")
const datetime = Variable(GLib.DateTime.new_now_local(), {
  poll: [1000, () => GLib.DateTime.new_now_local()],
})

function Clock() {
  return Widget.Box({
    class_name: "clock",
    vertical: true,
    spacing: 2,
    children: [
      Widget.Label({
        class_name: "time",
        label: datetime.bind().as(t => t.format("%I:%M%P")),
      }),
      Widget.Label({
        class_name: "date",
        label: datetime.bind().as(d => d.format("%a %b %e")),
      }),
    ],
  })
}

function Battery() {
  return Widget.LevelBar({
    class_name: "battery",
    visible: battery.bind("available"),
    widthRequest: 100,
    value: battery.bind("percent").as(p => p / 100),
  })
}

function InfoBox() {
  return Widget.Window({
    name: "infobox",
    class_name: "infobox",
    visible: false,
    anchor: ["bottom", "right"],
    child: Widget.Box({
      vertical: true,
      spacing: 10,
      children: [ Clock(), Battery() ],
    }),
  })
}

App.config({
  style: "./style.css",
  windows: [ InfoBox() ],
})
