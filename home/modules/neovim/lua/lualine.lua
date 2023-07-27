require("lualine").setup {
   options = {
      globalstatus = true,
      component_separators = "|",
      section_separators = "",
   },

   sections = {
      lualine_a = { "mode" },
      lualine_b = {{ "branch", icon = "󰘬" }},

      lualine_c = {
         { "diagnostics" },
         { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
         { "filename", path = 1 },
      },

      lualine_x = { "diff" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
   },

   extensions = { "man" },
}
