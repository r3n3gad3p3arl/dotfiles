{
  programs.nixvim = {
    plugins.mini.modules.pick.window.config.__raw = ''
      function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        return {
          anchor = 'NW', height = height, width = width,
          row = math.floor(0.5 * (vim.o.lines - height)),
          col = math.floor(0.5 * (vim.o.columns - width)),
        }
      end
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader><space>";
        action = "<cmd>Pick files<cr>";
      }
      {
        mode = "n";
        key = "<leader>fF";
        action.__raw = "function() MiniPick.builtin.files(nil, { source = { cwd = vim.lsp.get_client_by_id(1).root_dir } }) end";
      }
      {
        mode = "n";
        key = "<leader>/";
        action = "<cmd>Pick grep_live<cr>";
      }
      {
        mode = "n";
        key = "<leader>,";
        action = "<cmd>Pick buffers<cr>";
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Pick help<cr>";
      }
    ];
  };
}
