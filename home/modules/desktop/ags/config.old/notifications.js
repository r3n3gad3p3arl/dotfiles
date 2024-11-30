const notifications = await Service.import("notifications")

function NotificationIcon({ app_entry, app_icon, image }) {
  if (image) {
    return Widget.Box({
      vpack: "center",
      class_name: "icon",
      css: `background-image: url("${image}");`
        + "background-size: cover;"
        + "background-repeat: no-repeat;"
        + "background-position: center;"
        + "min-width: 64px; min-height: 64px;",
    })
  }

  let icon = "dialog-information-symbolic"
  if (Utils.lookUpIcon(app_icon))
    icon = app_icon

  if (app_entry && Utils.lookUpIcon(app_entry))
    icon = app_entry

  return Widget.Box({
    vpack: "center",
    class_name: "icon",
    child: Widget.Icon({
      icon,
      size: 32,
    }),
  })
}

function Notification(n) {
  const title = Widget.Label({
    class_name: "title",
    xalign: 0,
    justification: "left",
    hexpand: true,
    max_width_chars: 24,
    truncate: "end",
    wrap: true,
    label: n.summary,
    use_markup: true,
  })

  const body = Widget.Label({
    class_name: "body",
    hexpand: true,
    use_markup: true,
    xalign: 0,
    justification: "left",
    label: n.body,
    wrap: true,
  })

  const actions = n.actions.length > 0 ? Widget.Box({
    class_name: "actions",
    children: n.actions.map(({ id, label }) => Widget.Button({
      class_name: "action-button",
      on_clicked: () => {
        n.invoke(id)
        n.dismiss()
      },
      hexpand: true,
      child: Widget.Label(label),
    })),
  }) : null

  return Widget.EventBox(
    {
      attribute: { id: n.id },
      on_primary_click: n.dismiss,
    },
    Widget.Box(
      {
        class_name: `notification ${n.urgency}`,
        vertical: true,
      },
      Widget.Box([
        NotificationIcon(n),
        Widget.Box(
          { vertical: true },
          title,
          body,
        ),
      ]),
      actions,
    ),
  )
}

export function NotificationPopups(monitor = 0) {
  const list = Widget.Box({
    vertical: true,
    children: notifications.popups.map(Notification),
  })

  function onNotified(_, id) {
    const n = notifications.getNotification(id)
    if (n)
      list.children = [Notification(n), ...list.children]
  }

  function onDismissed(_, id) {
    list.children.find(n => n.attribute.id === id)?.destroy()
  }

  list.hook(notifications, onNotified, "notified")
    .hook(notifications, onDismissed, "dismissed")

  return Widget.Window({
    monitor,
    name: `notifications${monitor}`,
    class_name: "notifications",
    anchor: ["top", "right"],
    child: Widget.Box({
      css: "min-width: 2px; min-height: 2px;",
      vertical: true,
      child: list,
    }),
  })
}
