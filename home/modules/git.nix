{ lib, config, pkgs, ... }: {
  programs.git.settings = {
    user = {
      name = "r3n3gad3p3arl";
      email = "20760527+r3n3gad3p3arl@users.noreply.github.com";
    };

    init.defaultBranch = "main";
  };

  home.packages = lib.mkIf config.programs.git.enable (with pkgs; [ git-filter-repo ]);
}
