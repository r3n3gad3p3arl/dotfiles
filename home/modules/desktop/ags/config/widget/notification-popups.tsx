import { Astal, Gtk, Gdk } from "astal/gtk3"
import Notifd from "gi://AstalNotifd"
import Notification from "./notification"
import { type Subscribable } from "astal/binding"
import { Variable, bind, timeout } from "astal"

const TIMEOUT_DELAY = 5000

class NotificationMap implements Subscribable {
  private map: Map<number, Gtk.Widget> = new Map()
  private var: Variable<Array<Gtk.Widget>> = Variable([])

  private notify() {
    this.var.set([...this.map.values()].reverse())
  }

  constructor() {
    const notifd = Notifd.get_default()

    notifd.connect("notified", (_, id) => {
      this.set(id, Notification({
        notification: notifd.get_notification(id)!,
        onHoverLost: () => this.delete(id),
        setup: () => timeout(TIMEOUT_DELAY, () => {
          this.delete(id)
        })
      }))
    })

    notifd.connect("resolved", (_, id) => {
      this.delete(id)
    })
  }

  private set(key: number, value: Gtk.Widget) {
    this.map.get(key)?.destroy()
    this.map.set(key, value)
    this.notify()
  }

  private delete(key: number) {
    this.map.get(key)?.destroy()
    this.map.delete(key)
    this.notify()
  }

  get() {
    return this.var.get()
  }

  subscribe(callback: (list: Array<Gtk.Widget>) => void) {
    return this.var.subscribe(callback)
  }
}

export default function NotificationPopups(gdkmonitor: Gdk.Monitor) {
  const {TOP, RIGHT} = Astal.WindowAnchor
  const notifs = new NotificationMap()

  return <window
    className="notification-popup"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | RIGHT}>
      <box vertical>
        {bind(notifs)}
      </box>
  </window>
}
