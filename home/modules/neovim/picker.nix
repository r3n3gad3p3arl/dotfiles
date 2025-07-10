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
      { mode = "n"; key = "<leader><space>"; action.__raw = "function() MiniPick.builtin.files() end"; }
      { mode = "n"; key = "<leader>/"; action.__raw = "function() MiniPick.builtin.grep_live() end"; }
      { mode = "n"; key = "<leader>,"; action.__raw = "function() MiniPick.builtin.buffers() end"; }
      { mode = "n"; key = "<leader>fh"; action.__raw = "function() MiniPick.builtin.help() end"; }
    ];
  };
}
