{
  flake.modules.homeManager.git =
    { pkgs, ... }:
    {
      programs.git = {
        enable = true;

        settings = {
          user = {
            name = "r3n3gad3p3arl";
            email = "20760527+r3n3gad3p3arl@users.noreply.github.com";
          };

          init.defaultBranch = "main";
        };

        signing.format = "openpgp";
      };

      home.packages = [ pkgs.git-filter-repo ];
    };
}
