require("hyprland.variables")

hl.on("hyprland.start", function()
  hl.exec_cmd(string.format("hyprctl setcursor %s %s", cursor.name, cursor.size))
end)
