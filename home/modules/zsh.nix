{ config, pkgs, ... }: {
   programs.zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      autocd = true;
      defaultKeymap = "viins";
      dotDir = ".config/zsh";
      history.path = "${config.xdg.stateHome}/zsh/history";

      shellAliases = {
         nixupd = "sudo nixos-rebuild switch --flake ~/.config/nixos#";
      };
   };
}
