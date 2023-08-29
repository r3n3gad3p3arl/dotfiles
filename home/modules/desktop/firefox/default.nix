{ pkgs, ... }: {
   imports = [ ./tridactyl.nix ];

   programs.firefox = {
      package = pkgs.firefox.override {
         cfg = { enableTridactylNative = true; };
      };

      profiles.default = {
         bookmarks = [
            {
               name = "Linux";

               bookmarks = [
                  { name = "Home Manager Manual"; url = "https://nix-community.github.io/home-manager/options.html"; }
               ];
            }

            {
               name = "Media";

               bookmarks = [
                  { name = "FMHY"; url = "https://fmhy.pages.dev"; }
               ];
            }
         ];

         extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            tridactyl
            darkreader
            to-deepl
         ];

         search = {
            default = "SearXNG (tiekoetter)";
            force = true;

            engines = {
               "SearXNG (tiekoetter)" = {
                  urls = [{ template = "https://searx.tiekoetter.com/search?q={searchTerms}"; }];
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
