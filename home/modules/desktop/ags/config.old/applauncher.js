const { query } = await Service.import("applications")
const WINDOW_NAME = "applauncher"

const AppItem = app => Widget.Button({
  class_name: "app-item",
  on_clicked: () => {
    App.closeWindow(WINDOW_NAME)
    app.launch()
  },
  attribute: { app },
  child: Widget.Box({
    children: [
      Widget.Icon({
        class_name: "icon",
        icon: app.icon_name || "",
        size: 32,
      }),
      Widget.Label({
        class_name: "title",
        label: app.name,
        xalign: 0,
        vpack: "center",
        truncate: "end",
      }),
    ],
  }),
})

const appbox = () => {
  let applications = query("").map(AppItem)

  const list = Widget.Box({
    class_name: "app-list",
    vertical: true,
    children: applications,
  })

  function repopulate() {
    applications = query("").map(AppItem)
    list.children = applications
  }

  const entry = Widget.Entry({
    class_name: "search-entry",
    hexpand: true,

    on_accept: () => {
      const results = applications.filter((item) => item.visible);
      if (results[0]) {
        App.toggleWindow(WINDOW_NAME)
        results[0].attribute.app.launch()
      }
    },

    on_change: ({ text }) => applications.forEach(item => {
      item.visible = item.attribute.app.match(text ?? "")
    }),
  })

  return Widget.Box({
    vertical: true,
    children: [
      entry,

      Widget.Scrollable({
        hscroll: "never",
        css: `min-width: 500px;`
           + `min-height: 500px;`,
        child: list,
      }),
    ],
    setup: self => self.hook(App, (_, windowName, visible) => {
      if (windowName !== WINDOW_NAME)
        return

      if (visible) {
        repopulate()
        entry.text = ""
        entry.grab_focus()
      }
    }),
  })
}

export const AppLauncher = Widget.Window({
  name: WINDOW_NAME,
  class_name: WINDOW_NAME,
  setup: self => self.keybind("Escape", () => {
    App.closeWindow(WINDOW_NAME)
  }),
  visible: false,
  keymode: "exclusive",
  child: appbox(),
})
