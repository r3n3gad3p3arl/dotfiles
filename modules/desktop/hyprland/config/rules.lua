hl.window_rule({
  match = {
    class = "firefox",
    title = "Picture-in-Picture",
  },

  float = true,
  pin = true,
  keep_aspect_ratio = true,

  move = {
    "monitor_w - window_w - 10",
    "monitor_h - window_h - 10"
  },

  size = { "25%", "25%" },
})

hl.window_rule({
  match = {
    title = "Save.*",
  },

  float = true,
})

hl.window_rule({
  match = {
    title = "Open.*",
  },

  float = true,
})

hl.window_rule({
  match = {
    title = "(Enter name of file to save to)(.*)",
  },

  float = true,
})

hl.window_rule({
  match = {
    class = "org.keepassxc.KeePassXC",
  },

  workspace = "special silent",
})

hl.window_rule({
  match = {
    float = false,
    workspace = "w[tv1]",
  },

  border_size = 0,
})
