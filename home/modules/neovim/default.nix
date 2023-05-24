{ pkgs, ... }: {
   programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraLuaConfig = builtins.readFile ./init.lua;

      plugins = with pkgs.vimPlugins; [
         lualine-nvim
         #nvim-web-devicons
         indent-blankline-nvim
         nvim-base16
         (nvim-treesitter.withPlugins (p: with p; [ c lua vim vimdoc query nix css python ]))
      ];
   };
}
