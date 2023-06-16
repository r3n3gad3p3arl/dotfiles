vim.g.mapleader = " "
vim.g.maplocalleader = " "

local diag = vim.diagnostic
local api = vim.api

local tbuiltin = require("telescope.builtin")

local map = function(modes, keys, func, opts)
   vim.keymap.set(modes, keys, func, opts)
end

local nmap;
nmap = function(keys, func, opts)
   map("n", keys, func, opts)
end

nmap("[d", diag.goto_prev)
nmap("]d", diag.goto_next)
nmap("<leader>e", diag.open_float)
nmap("<leader>q", diag.setloclist)

api.nvim_create_autocmd("LspAttach", {
   group = api.nvim_create_augroup("UserLspConfig", {}),
   callback = function(ev)
      local supernmap = nmap
      nmap = function(keys, func)
         supernmap(keys, func, { buffer = ev.buf })
      end

      local lspbuf = vim.lsp.buf

      nmap("<leader>rn", lspbuf.rename)
      nmap("<leader>ca", lspbuf.code_action)

      nmap("gd", lspbuf.definition)
      nmap("gr", tbuiltin.lsp_references)
      nmap("gi", lspbuf.implementation)
      nmap("<leader>D", lspbuf.type_definition)
      nmap("<leader>ds", tbuiltin.lsp_document_symbols)

      nmap("K", lspbuf.hover)
      nmap("<C-k>", lspbuf.signature_help)

      nmap("gD", lspbuf.declaration)
      nmap("<leader>wa", lspbuf.add_workspace_folder)
      nmap("<leader>wr", lspbuf.remove_workspace_folder)
      nmap("<leader>wl", function()
         print(vim.inspect(lspbuf.list_workspace_folders()))
      end)

      api.nvim_buf_create_user_command(ev.buf, "Format", function(_)
         lspbuf.format()
      end, {})
   end,
})

nmap("<leader>ff", tbuiltin.find_files)
nmap("<leader>fr", tbuiltin.oldfiles)
nmap("<leader>h", tbuiltin.help_tags)
nmap("<leader>g", tbuiltin.live_grep)
nmap("<leader>b", tbuiltin.buffers)
nmap("<leader>/", tbuiltin.current_buffer_fuzzy_find)
