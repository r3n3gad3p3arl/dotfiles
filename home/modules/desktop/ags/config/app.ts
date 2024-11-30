import { App } from "astal/gtk3"
import style from "./style.scss"
import InfoBox from "./widget/infobox"
import AppLauncher from "./widget/applauncher"
import NotificationPopups from "./widget/notification-popups"

App.start({
  css: style,
  main() {
    InfoBox()
    AppLauncher()
    App.get_monitors().map(NotificationPopups)
  },
})
