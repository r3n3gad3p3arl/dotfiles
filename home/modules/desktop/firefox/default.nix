{ pkgs, ... }: {
   imports = [ ./tridactyl.nix ];

   programs.firefox = {
      enable = true;

      package = pkgs.firefox.override {
         cfg = { enableTridactylNative = true; };
      };

      profiles.default = {
         bookmarks = [
            {
               name = "Linux";

               bookmarks = [
                  { name = "NixOS Wiki"; url = "https://nixos.wiki"; }
                  { name = "NixOS Search"; url = "https://search.nixos.org"; }
                  { name = "Home Manager Manual"; url = "https://nix-community.github.io/home-manager"; }
                  { name = "Arch Linux Wiki"; url = "https://wiki.archlinux.org"; }
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
            };
         };

         userChrome = builtins.readFile ./userChrome.css;
         settings = import ./settings.nix;
      };
   };
}
