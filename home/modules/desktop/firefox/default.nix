{ pkgs, ... }: {
   imports = [
      ./settings.nix
   ];

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
         ];

         search = {
            default = "SearXNG (tiekoetter)";
            force = true;

            engines = {
               "SearXNG (tiekoetter)" = {
                  urls = [{ template = "https://searx.tiekoetter.com/search?q={searchTerms}"; }];
                  definedAliases = [ "@searx" "@sx" ];
               };
            };
         };

         userChrome = builtins.readFile ../../../config/firefox/userChrome.css;
      };
   };
}
