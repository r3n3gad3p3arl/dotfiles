{ config, pkgs, ... }: {
   programs.zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      autocd = true;
      defaultKeymap = "viins";
      dotDir = ".config/zsh";
      history.path = "${config.xdg.stateHome}/zsh/history";

      dirHashes = {
         docs = config.xdg.userDirs.documents;
         dl = config.xdg.userDirs.download;
         music = config.xdg.userDirs.music;
         pics = config.xdg.userDirs.pictures;
         vids = config.xdg.userDirs.videos;
         nixconf = "${config.xdg.configHome}/nixos";
      };

      shellAliases = {
         nixupd = "sudo nixos-rebuild switch --flake ${config.xdg.configHome}/nixos#";
      };
   };
}
