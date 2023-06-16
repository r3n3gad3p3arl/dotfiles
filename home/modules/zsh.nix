{ config, pkgs, ... }: {
   programs.zsh = {
      enableSyntaxHighlighting = true;
      enableVteIntegration = true;
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
         nixcfg = "${config.xdg.configHome}/nixos";
      };

      shellAliases = {
         nixupd = "sudo nixos-rebuild switch --flake ${config.xdg.configHome}/nixos#";
         nixclean = "sudo nix-collect-garbage -d";
         md = "mkdir -pv";
         cp = "cp -iv";
         cpr = "cp -ivr";
         mv = "mv -iv";
         rm = "rm -Iv";
         rmr = "rm -Ivr";
         e = "$EDITOR";
      };
   };
}
