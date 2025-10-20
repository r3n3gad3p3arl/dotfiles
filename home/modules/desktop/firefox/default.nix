{ pkgs, ... }: {
  imports = [ ./tridactyl.nix ];

  programs.firefox = {
    package = pkgs.firefox.override {
      nativeMessagingHosts = with pkgs; [ tridactyl-native ];
    };

    profiles.default = {
      bookmarks = {
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

      extensions = {
        force = true;

        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tridactyl
          sponsorblock
        ];
      };

      search = {
        default = "searxng";
        force = true;

        engines = {
          searxng = {
            name = "SearXNG";
            urls = [{
              template = "https://searx.tiekoetter.com/search";
              params = [
                { name = "q"; value = "{searchTerms}"; }
                { name = "language"; value = "en"; }
                { name = "time_range"; value = ""; }
                { name = "safesearch"; value = "0"; }
                { name = "categories"; value = "general"; }
              ];
            }];
            definedAliases = [ "@searx" "@sx" ];
          };

          nixpkgs = {
            name = "NixOS Packages";
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "from"; value = "0"; }
                { name = "size"; value = "50"; }
                { name = "sort"; value = "relevance"; }
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "@nixpkgs" "@np" ];
          };

          nixopts = {
            name = "NixOS Options";
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "from"; value = "0"; }
                { name = "size"; value = "50"; }
                { name = "sort"; value = "relevance"; }
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "@nixopts" "@no" ];
          };

          nixwiki = {
            name = "NixOS Wiki";
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            definedAliases = [ "@nixwiki" "@nw" ];
          };
        };
      };

      userChrome = builtins.readFile ./userChrome.css;
      settings = import ./settings.nix;
    };
  };
}
