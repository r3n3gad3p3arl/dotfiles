{ pkgs, ... }: {
  imports = [ ./tridactyl.nix ];

  programs.firefox = {
    package = pkgs.firefox.override {
      nativeMessagingHosts = with pkgs; [ tridactyl-native ];
    };

    profiles.default = {
      bookmarks = [
      {
        name = "Linux";

        bookmarks = [
          { name = "Home Manager Manual"; url = "https://nix-community.github.io/home-manager/options.xhtml"; }
        ];
      }

      {
        name = "Media";

        bookmarks = [
          { name = "FMHY"; url = "https://fmhy.pages.dev"; }
        ];
      }

      {
        name = "School";

        bookmarks = [
          { name = "myLoneStar Login"; url = "https://my.lonestar.edu"; }
        ];
      }
      ];

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        tridactyl
        darkreader
        to-deepl
        libredirect
      ];

      search = {
        default = "SearXNG (priv.au)";
        force = true;

        engines = {
          "SearXNG (priv.au)" = {
            urls = [{ template = "https://priv.au/search?q={searchTerms}"; }];
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

          "Arch Linux Wiki" = {
            urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
            definedAliases = [ "@archwiki" "@aw" ];
          };
        };
      };

      userChrome = builtins.readFile ./userChrome.css;
      settings = import ./settings.nix;
    };
  };
}
