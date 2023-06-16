local telescope = require("telescope")

telescope.setup{
   defaults = {
      borderchars =  { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
   },
   pickers = {
      current_buffer_fuzzy_find = {
         theme = "dropdown",
         previewer = false,
         borderchars = {
            prompt =  { "─", "│", "─", "│", "┌", "┐", "│", "│" },
            results =  { "─", "│", "─", "│", "├", "┤", "┘", "└" },
         },
      },
   },
}

telescope.load_extension("fzf")
