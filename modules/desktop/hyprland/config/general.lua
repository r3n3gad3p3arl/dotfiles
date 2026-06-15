require("hyprland.variables")

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1,
})

hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,

    col = {
      active_border = string.format("rgb(%s)", colors.base03),
      inactive_border = string.format("rgb(%s)", colors.base01),
    },
  },

  decoration = {
    shadow = { enabled = false },
    blur = { enabled = false },
  },

  input = {
    numlock_by_default = true,
  },

  dwindle = {
    preserve_split = true,
  },

  misc = {
    enable_swallow = true,
    swallow_regex = "(footclient|foot)",
  },
})

hl.curve("easeOutQuint", {
  type = "bezier",
  points = { {0.22, 1}, {0.36, 1} }
})

hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint",
  style = "popin 90%"
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 2,
  bezier = "easeOutQuint",
  style = "popin 90%"
})
hl.animation({
  leaf = "windowsMove",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint",
})
hl.animation({
  leaf = "layersIn",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint",
  style = "fade"
})
hl.animation({
  leaf = "layersOut",
  enabled = true,
  speed = 2,
  bezier = "easeOutQuint",
  style = "fade"
})
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint",
  style = "slide"
})
hl.animation({
  leaf = "specialWorkspace",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint",
  style = "slidevert"
})
hl.animation({
  leaf = "fadeIn",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint"
})
hl.animation({
  leaf = "fadeOut",
  enabled = true,
  speed = 2,
  bezier = "easeOutQuint"
})
hl.animation({
  leaf = "fadeLayersIn",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint"
})
hl.animation({
  leaf = "fadeLayersOut",
  enabled = true,
  speed = 2,
  bezier = "easeOutQuint"
})
