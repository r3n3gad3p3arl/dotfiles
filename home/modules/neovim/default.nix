{ lib, inputs, config, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ] ++ lib.meow.mapModules ./.;

  programs.nixvim = {
    colorschemes.base16 = {
      enable = true;
      colorscheme = config.colorScheme.slug;
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      hlsearch = false;
      number = true;
      relativenumber = true;
      mouse = "a";
      undofile = true;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      smartindent = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      wrap = false;
      termguicolors = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      # Move lines
      { mode = "n"; key = "<A-j>"; action = "<cmd>m .+1<cr>=="; }
      { mode = "n"; key = "<A-k>"; action = "<cmd>m .-2<cr>=="; }
      { mode = "i"; key = "<A-j>"; action = "<esc><cmd>m .+1<cr>==gi"; }
      { mode = "i"; key = "<A-k>"; action = "<esc><cmd>m .-2<cr>==gi"; }
      { mode = "v"; key = "<A-j>"; action = ":m '>+1<cr>gv=gv"; }
      { mode = "v"; key = "<A-k>"; action = ":m '>-2<cr>gv=gv"; }

      # Navigate buffers
      { mode = "n"; key = "<S-h>"; action = "<cmd>bprevious<cr>"; }
      { mode = "n"; key = "<S-l>"; action = "<cmd>bnext<cr>"; }
      { mode = "n"; key = "[b"; action = "<cmd>bprevious<cr>"; }
      { mode = "n"; key = "]b"; action = "<cmd>bnext<cr>"; }

      # Navigate windows
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.remap = true; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.remap = true; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.remap = true; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.remap = true; }
      { mode = "n"; key = "<leader>ww"; action = "<C-w>p"; options.remap = true; }

      # Create/delete windows
      { mode = "n"; key = "<leader>wd"; action = "<C-w>c"; options.remap = true; }
      { mode = "n"; key = "<leader>wb"; action = "<C-w>s"; options.remap = true; }
      { mode = "n"; key = "<leader>wr"; action = "<C-w>v"; options.remap = true; }
    ];

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      indent-blankline.enable = true;
      treesitter.enable = true;
      ts-context-commentstring.enable = true;
      ts-autotag.enable = true;
      lsp.enable = true;
      cmp.enable = true;
      comment.enable = true;
      illuminate.enable = true;
      nvim-autopairs.enable = true;
    };
  };

  home.sessionVariables = lib.mkIf config.programs.nixvim.enable {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
  };
}
