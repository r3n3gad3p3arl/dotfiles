{ pkgs, config, ... }: {
  programs.emacs = {
    package = pkgs.emacs29-pgtk;

    extraPackages = epkgs: with epkgs; [
      catppuccin-theme
      doom-themes
      doom-modeline
      nerd-icons
      nerd-icons-completion
      nerd-icons-corfu
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
      yasnippet
      yasnippet-capf
      yasnippet-snippets
      nix-mode
      nix-ts-mode
      lua-mode
      org-appear
      olivetti
      mixed-pitch
      vterm
      pkgs.gccgo # needed to install tree-sitter grammars
    ];
  };

  xdg.configFile."emacs" = {
    enable = config.programs.emacs.enable;
    source = ./config;
    recursive = true;
  };
}
