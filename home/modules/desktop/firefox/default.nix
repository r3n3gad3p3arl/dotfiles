{ pkgs, ... }: {
  imports = [ ./tridactyl.nix ];

  programs.firefox = {
    package = pkgs.firefox.override {
      nativeMessagingHosts = with pkgs; [ tridactyl-native ];
    };

    profiles.default = {
      bookmarks = [
        { name = "Home Manager Manual"; url = "https://nix-community.github.io/home-manager/options.xhtml"; }
        { name = "FMHY"; url = "https://fmhy.net"; }
        { name = "myLoneStar Login"; url = "https://my.lonestar.edu"; }
      ];

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        tridactyl
        sponsorblock
      ];

      search = {
        default = "SearXNG";
        force = true;

        engines = {
          "SearXNG" = {
            urls = [{ template = "https://searx.neocities.org/?q={searchTerms}"; }];
            definedAliases = [ "@searx" "@sx" ];
          };

          "NixOS Packages" = {
            urls = [{ template = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}"; }];
            definedAliases = [ "@nixpkgs" "@np" ];
          };

          "NixOS Options" = {
            urls = [{ template = "https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}"; }];
            definedAliases = [ "@nixopts" "@no" ];
          };

          "NixOS Wiki" = {
            urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
            definedAliases = [ "@nixwiki" "@nw" ];
          };

          "YouTube" = {
            urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
            definedAliases = [ "@youtube" "@yt" ];
          };
        };
      };

      userChrome = builtins.readFile ./userChrome.css;
      settings = import ./settings.nix;
    };
  };
}
