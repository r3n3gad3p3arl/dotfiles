import { Variable } from "astal"
import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import Apps from "gi://AstalApps"

const MAX_ITEMS = 6

function hide() {
  App.get_window("applauncher")!.hide()
}

function AppButton({ app }: { app: Apps.Application }) {
  return <button
    className="app-button"
    onClicked={() => { hide(); app.launch() }}>
    <box>
      <icon icon={app.iconName} />
      <label
        className="name"
        truncate
        xalign={0}
        label={app.name}
      />
    </box>
  </button>
}

export default function AppLauncher() {
  const { CENTER } = Gtk.Align
  const apps = new Apps.Apps()

  const text = Variable("")
  const list = text(text => apps.fuzzy_query(text).slice(0, MAX_ITEMS))
  const onEnter = () => {
    apps.fuzzy_query(text.get())?.[0].launch()
    hide()
  }

  return <window
    name="applauncher"
    className="applauncher"
    application={App}
    visible={false}
    keymode={Astal.Keymode.EXCLUSIVE}
    onShow={() => text.set("")}
    onKeyPressEvent={function (self, event: Gdk.Event) {
      if (event.get_keyval()[1] === Gdk.KEY_Escape)
        self.hide()
    }}>
    <box vertical>
      <entry
        placeholderText="Search"
        text={text()}
        onChanged={self => text.set(self.text)}
        onActivate={onEnter}
      />
      <box spacing={8} className="listbox" vertical>
        {list.as(list => list.map((app: Apps.Application) => (
          <AppButton app={app} />
        )))}
      </box>
      <box
        halign={CENTER}
        className="not-found"
        vertical
        visible={list.as(l => l.length === 0)}>
          <icon icon="system-search-symbolic" />
          <label label="No match found" />
      </box>
    </box>
  </window>
}
