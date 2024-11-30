import { InfoBox } from "./infobox.js"
import { AppLauncher } from "./applauncher.js"
import { NotificationPopups } from "./notifications.js"

App.config({
  style: "./style.css",
  windows: [ InfoBox, AppLauncher, NotificationPopups() ],
})
