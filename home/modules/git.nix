{ lib, config, pkgs, ... }: {
  programs.git = {
    userName = "r3n3gad3p3arl";
    userEmail = "20760527+r3n3gad3p3arl@users.noreply.github.com";
    extraConfig = { init.defaultBranch = "main"; };
  };

  home.packages = lib.mkIf config.programs.git.enable (with pkgs; [ git-filter-repo ]);
}
