{ lib, inputs, config, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ] ++ lib.meow.mapModules ./.;

  programs.nixvim = {
    defaultEditor = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      undofile = true;
      mouse = "a";
      breakindent = true;
      cursorline = true;
      linebreak = true;
      number = true;
      relativenumber = true;
      splitbelow = true;
      splitright = true;
      wrap = false;
      signcolumn = "yes";
      fillchars = "eob: ";
      ignorecase = true;
      smartcase = true;
      smartindent = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      confirm = true;
      scrolloff = 4;
      smoothscroll = true;
      timeoutlen = 300;
      updatetime = 200;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      # Clear highlights
      { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; }

      # Better j/k
      { mode = ["n" "x"]; key = "j"; action = "v:count == 0 ? 'gj' : 'j'"; options.expr = true; }
      { mode = ["n" "x"]; key = "k"; action = "v:count == 0 ? 'gk' : 'k'"; options.expr = true; }

      # Navigate buffers
      { mode = "n"; key = "<S-h>"; action = "<cmd>bprevious<cr>"; }
      { mode = "n"; key = "<S-l>"; action = "<cmd>bnext<cr>"; }
      { mode = "n"; key = "<leader>bd"; action = "<cmd>bdelete<cr>"; }

      # Navigate windows
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.remap = true; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.remap = true; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.remap = true; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.remap = true; }

      # Create/delete windows
      { mode = "n"; key = "<leader>wd"; action = "<C-w>c"; options.remap = true; }
      { mode = "n"; key = "<leader>wb"; action = "<C-w>s"; options.remap = true; }
      { mode = "n"; key = "<leader>wr"; action = "<C-w>v"; options.remap = true; }
    ];

    plugins = {
      lz-n.enable = true;
      treesitter.enable = true;
      lspconfig.enable = true;
      blink-cmp.enable = true;
      mini.enable = true;
    };
  };

  home.sessionVariables = lib.mkIf config.programs.nixvim.enable {
    MANPAGER = "nvim +Man!";
  };
}
