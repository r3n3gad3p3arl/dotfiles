vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.o

o.clipboard = "unnamedplus"
o.cursorline = true
o.expandtab = true
o.smartindent = true
o.breakindent = true
o.shiftwidth = 3
o.tabstop = 3
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.number = true
o.relativenumber = true
o.showmode = false
o.termguicolors = true
o.wrap = false
o.hlsearch = false
o.undofile = true
o.signcolumn = "yes"

vim.cmd("colorscheme base16-tomorrow-night")

require("lualine").setup {
   options = {
      globalstatus = true,
      component_separators = "|",
      section_separators = "",
   },

   sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },

      lualine_c = {
         { "diagnostics" },
         { "filetype", icon_only = true },
         { "filename", path = 1 },
      },

      lualine_x = { "diff" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
   },
}

require("indent_blankline").setup()

require("nvim-treesitter.configs").setup {
   ensure_installed = {},
   auto_install = false,
   highlight = { enable = true },
}
