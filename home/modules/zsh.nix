{ config, ... }: {
  programs.zsh = {
    syntaxHighlighting.enable = true;
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
      cfg = "${config.xdg.configHome}/nixos";
    };

    shellAliases = {
      rb = "sudo nixos-rebuild switch --flake ${config.programs.zsh.dirHashes.cfg}#";
      clean = "sudo nix-collect-garbage -d";
      flup = "nix flake update";

      md = "mkdir -pv";
      cp = "cp -iv";
      cpr = "cp -ivr";
      mv = "mv -iv";
      rm = "rm -Iv";
      rmr = "rm -Ivr";
      e = "$EDITOR";
      ping = "ping -c 3";

      gst = "git status -s";
      ga = "git add";
      gcm = "git commit -m";
      gp = "git push";
      gcl = "git clone";
      gl = "git log --oneline";
      gr = "git remote -v";
    };
  };
}
