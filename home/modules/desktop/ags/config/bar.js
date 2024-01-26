import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import GLib from "gi://GLib";

const Workspaces = () => Widget.Box({
  class_name: "workspaces",
  children: Hyprland.bind("workspaces").transform(ws => {
    return ws.map(({ id }) => Widget.Button({
      on_clicked: () => Hyprland.sendMessage(`dispatch workspace ${id}`),
      child: Widget.Label(`${id}`),
      class_name: Hyprland.active.workspace.bind("id")
        .transform(i => `${i === id ? "focused" : ""}`),
    }));
  }),
});

const Clock = () => Widget.Label({
  class_name: "clock",
  setup: self => self.poll(1000, () => {
    self.label = GLib.DateTime.new_now_local().format("%I:%M %p • %a %b %d");
  }),
});

const Media = () => Widget.Button({
  class_name: "media",
  visible: Mpris.bind("players").transform(p => p.length > 0),
  on_primary_click: () => Mpris.getPlayer("")?.playPause(),
  child: Widget.Label().hook(Mpris, self => {
    const { trackTitle } = Mpris.players[0];
    self.label = trackTitle;
    self.truncate = "end";
    self.max_width_chars = 40;
  }, "player-changed"),
});

const BatLevel = () => Widget.ProgressBar({
  class_name: "battery",
  visible: Battery.bind("available"),
  fraction: Battery.bind("percent").transform(p => {
    return p > 0 ? p / 100 : 0;
  }),
});

const Left = () => Widget.Box({
  spacing: 8,
  children: [
    Workspaces(),
  ],
});

const Center = () => Widget.Box({
  spacing: 8,
  children: [
    Clock(),
  ],
});

const Right = () => Widget.Box({
  hpack: "end",
  vpack: "center",
  spacing: 8,
  children: [
    Media(Mpris.getPlayer("mpv")),
    BatLevel(),
  ],
});

export const Bar = (monitor = 0) => Widget.Window({
  name: `bar-${monitor}`,
  class_name: "bar",
  monitor,
  anchor: ["bottom", "left", "right"],
  exclusivity: "exclusive",
  child: Widget.CenterBox({
    start_widget: Left(),
    center_widget: Center(),
    end_widget: Right(),
  }),
});
