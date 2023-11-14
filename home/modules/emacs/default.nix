{ pkgs, config, ... }: {
   programs.emacs = {
      package = pkgs.emacs29-pgtk;

      extraPackages = epkgs: with epkgs; [
         catppuccin-theme
         doom-themes
         doom-modeline
         nerd-icons
         nerd-icons-completion
         no-littering
         general
         evil
         evil-collection
         evil-nerd-commenter
         vertico
         orderless
         marginalia
         consult
         embark
         embark-consult
         corfu
         cape
         nix-mode
         lua-mode
         vterm
      ];
   };

   xdg.configFile."emacs" = {
      enable = config.programs.emacs.enable;
      source = ./config;
      recursive = true;
   };
}
