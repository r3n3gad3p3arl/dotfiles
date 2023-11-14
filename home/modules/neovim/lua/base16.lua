local base16 = {}

function base16.set_colorscheme(cs)
   vim.cmd("colorscheme base16-" .. cs)
end

return base16
