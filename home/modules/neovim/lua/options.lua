local o = vim.o

-- shared clipboard between neovim and system
o.clipboard = "unnamedplus"

-- highlight current line
o.cursorline = true

-- turn tabs to spaces
o.expandtab = true

-- auto-indent
o.smartindent = true

-- tab size
o.shiftwidth = 2
o.tabstop = 2

-- ignore case in search unless it contains uppercase letters
o.ignorecase = true
o.smartcase = true

-- allow mouse usage
o.mouse = "a"

-- relative line numbers
o.number = true
o.relativenumber = true

-- nice colors in supported terminals
o.termguicolors = true

-- no line wrapping
o.wrap = false

-- don't highlight search results
o.hlsearch = false

-- save undo history
o.undofile = true

-- don't show mode (lualine handles this instead)
o.showmode = false

-- completion menu
o.completeopt = "menuone,noselect"
