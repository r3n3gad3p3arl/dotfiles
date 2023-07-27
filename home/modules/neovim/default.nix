{ pkgs, config, lib, ... }: {
   programs.neovim = {
      defaultEditor = true;

      plugins = with pkgs.vimPlugins; [
         lualine-nvim
         nvim-web-devicons
         indent-blankline-nvim
         nvim-base16

         nvim-lspconfig
         nvim-cmp
         cmp-nvim-lsp
         cmp-buffer
         cmp-path

         luasnip
         cmp_luasnip
         friendly-snippets

         plenary-nvim
         telescope-nvim
         telescope-fzf-native-nvim

         (nvim-treesitter.withPlugins (p: with p; [
            c
            lua
            vim
            vimdoc
            query
            nix
            css
            python
         ]))
      ];

      extraPackages = with pkgs; [
         lua-language-server
         python3Packages.python-lsp-server
         nixd

         ripgrep
         fd
      ];

      extraLuaConfig = ''
         require("meow.options")
         require("meow.keybinds")
         require("meow.lualine")
         require("meow.treesitter")
         require("meow.indent-blankline")
         require("meow.lsp")
         require("meow.cmp")
         require("meow.telescope")
         require("meow.base16").set_colorscheme("${config.colorScheme.slug}")
      '';
   };

   xdg.configFile."nvim/lua/meow" = {
      enable = config.programs.neovim.enable;
      source = ./lua;
   };

   home.sessionVariables = lib.mkIf config.programs.neovim.enable {
      MANPAGER = "nvim +Man!";
   };
}
