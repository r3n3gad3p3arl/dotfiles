local base16 = {}

function base16.set_colorscheme(cs)
   require("base16-colorscheme").with_config{ telescope = false }
   vim.cmd("colorscheme base16-" .. cs)
end

return base16
