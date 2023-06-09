{ pkgs, ... }: {
   imports = [ ./init.nix ];

   programs.neovim = {
      defaultEditor = true;

      plugins = with pkgs.vimPlugins; [
         lualine-nvim
         indent-blankline-nvim
         nvim-base16
         (nvim-treesitter.withPlugins (p: with p; [ c lua vim vimdoc query nix css python ]))
      ];
   };
}
