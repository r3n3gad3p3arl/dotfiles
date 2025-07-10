import { App } from "astal/gtk3"
import style from "./style.scss"
import InfoBox from "./widgets/infobox"
import AppLauncher from "./widgets/applauncher"
import NotificationPopups from "./widgets/notification-popups"
import OSD from "./widgets/osd"

App.start({
  css: style,
  main() {
    InfoBox()
    AppLauncher()
    App.get_monitors().map(NotificationPopups)
    App.get_monitors().map(OSD)
  },
})
