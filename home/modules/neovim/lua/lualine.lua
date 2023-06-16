require("lualine").setup {
   options = {
      icons_enabled = false,
      globalstatus = true,
      component_separators = "|",
      section_separators = "",
   },

   sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },

      lualine_c = {
         { "diagnostics" },
         { "filename", path = 1 },
         { "filetype" },
      },

      lualine_x = { "diff" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
   },

   extensions = { "man" },
}
