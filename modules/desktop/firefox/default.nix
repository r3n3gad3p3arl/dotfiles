{
  flake.modules.homeManager.firefox =
    { pkgs, ... }:
    {
      programs.firefox = {
        enable = true;

        package = pkgs.firefox.override {
          nativeMessagingHosts = [ pkgs.tridactyl-native ];
        };

        configPath = ".mozilla/firefox";

        profiles.default = {
          extensions = {
            force = true;

            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              tridactyl
              sponsorblock
              keepassxc-browser
              libredirect
            ];
          };

          userChrome = builtins.readFile ./userChrome.css;
        };
      };
    };
}
