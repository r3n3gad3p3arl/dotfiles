require("hyprland.variables")

local mod = "SUPER"

local function modBind(key)
  return string.format("%s + %s", mod, key)
end

-- programs
hl.bind(modBind("Return"), hl.dsp.exec_cmd(programs.terminal))
hl.bind(modBind("B"), hl.dsp.exec_cmd(programs.browser))
hl.bind("XF86Calculator", hl.dsp.exec_cmd(programs.calculator))
hl.bind(modBind("Escape"), hl.dsp.exec_cmd(programs.lockscreen))

-- basic keybinds
hl.bind(modBind("SHIFT + C"), hl.dsp.window.close())

hl.bind(modBind("F"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(modBind("SHIFT + F"), hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(modBind("H"), hl.dsp.focus({ direction = "left" }))
hl.bind(modBind("L"), hl.dsp.focus({ direction = "right" }))
hl.bind(modBind("K"), hl.dsp.focus({ direction = "up" }))
hl.bind(modBind("J"), hl.dsp.focus({ direction = "down" }))

hl.bind(modBind("SHIFT + H"), hl.dsp.window.move({ direction = "left" }))
hl.bind(modBind("SHIFT + L"), hl.dsp.window.move({ direction = "right" }))
hl.bind(modBind("SHIFT + K"), hl.dsp.window.move({ direction = "up" }))
hl.bind(modBind("SHIFT + J"), hl.dsp.window.move({ direction = "down" }))

for i = 1, 9 do
  hl.bind(modBind(i), hl.dsp.focus({ workspace = i }))
  hl.bind(modBind("SHIFT + " .. i), hl.dsp.window.move({ workspace = i }))
end

hl.bind(modBind("equal"), hl.dsp.focus({ workspace = "r+1" }))
hl.bind(modBind("minus"), hl.dsp.focus({ workspace = "r-1" }))

hl.bind(modBind("SHIFT + equal"), hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(modBind("SHIFT + minus"), hl.dsp.window.move({ workspace = "r-1" }))

hl.bind(modBind("0"), hl.dsp.workspace.toggle_special())
hl.bind(modBind("SHIFT + 0"), hl.dsp.window.move({ workspace = "special" }))

hl.bind(modBind("apostrophe"), hl.dsp.focus({ monitor = "+1" }))
hl.bind(modBind("semicolon"), hl.dsp.focus({ monitor = "-1" }))

hl.bind(modBind("comma"), hl.dsp.layout("swapcol l"))
hl.bind(modBind("period"), hl.dsp.layout("swapcol r"))

hl.bind(modBind("slash"), hl.dsp.layout("colresize +conf"))
hl.bind(modBind("SHIFT + slash"), hl.dsp.layout("colresize -conf"))

-- utilities
hl.bind(modBind("I"), hl.dsp.global("quickshell:infoBoxToggle"))
hl.bind(modBind("Space"), hl.dsp.global("quickshell:launcherToggle"))

hl.bind(modBind("O"), hl.dsp.exec_cmd(scripts.music .. " open_youtube"))
hl.bind(modBind("SHIFT + O"), hl.dsp.exec_cmd(scripts.music .. " play_shuffle"))

hl.bind("Print", hl.dsp.exec_cmd(scripts.screenshot .. " print_current_screen " .. screenshotDir))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(scripts.screenshot .. " print_selection " .. screenshotDir))

hl.bind(modBind("A"), hl.dsp.exec_cmd(scripts.autoclicker))
hl.bind(modBind("SHIFT + A"), hl.dsp.exec_cmd("pkill -f autoclicker"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(programs.playerctl .. " play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(programs.playerctl .. " previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(programs.playerctl .. " next"), { locked = true })

-- for keyboards without media keys
hl.bind(modBind("bracketleft"), hl.dsp.exec_cmd(programs.playerctl .. " previous"), { locked = true })
hl.bind(modBind("bracketright"), hl.dsp.exec_cmd(programs.playerctl .. " next"), { locked = true })
hl.bind(modBind("P"), hl.dsp.exec_cmd(programs.playerctl .. " play-pause"), { locked = true })
hl.bind(modBind("backslash"), hl.dsp.exec_cmd(programs.playerctl .. " stop"), { locked = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 4%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(programs.brightnessctl .. " -e4 -n2 set 2%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(programs.brightnessctl .. " -e4 -n2 set 2%-"), { locked = true, repeating = true })

hl.bind(modBind("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(modBind("Control_L"), hl.dsp.window.drag(), { mouse = true })
hl.bind(modBind("mouse:273"), hl.dsp.window.resize(), { mouse = true })
hl.bind(modBind("Alt_L"), hl.dsp.window.resize(), { mouse = true })
