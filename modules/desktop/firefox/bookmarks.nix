{
  flake.modules.homeManager.firefox = {
    programs.firefox.profiles.default.bookmarks = {
      force = true;

      settings = [
        {
          name = "Home Manager Manual";
          url = "https://nix-community.github.io/home-manager/options.xhtml";
        }
        {
          name = "FMHY";
          url = "https://fmhy.net";
        }
        {
          name = "LSC Login";
          url = "https://my.lonestar.edu";
        }
        {
          name = "YouTube";
          url = "https://youtube.com";
        }
      ];
    };
  };
}
