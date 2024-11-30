const audio = await Service.import("audio")

function Osd() {
  const osdLevel = Widget.LevelBar({
    widthRequest: 100,
    value,
  })

  return Widget.Box({
    child: osdLevel,
  })
}

export function Indicators(monitor = 0) {
  return Widget.Window({
    monitor,
    name: `indicators${monitor}`,
    class_name: "indicators",
    anchor: ["bottom"],
  })
}
