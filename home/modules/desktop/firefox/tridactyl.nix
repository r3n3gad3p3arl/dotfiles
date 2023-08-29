{ config, ... }: {
   xdg.configFile."tridactyl/tridactylrc" = {
      enable = config.programs.firefox.enable;

      text = ''
         set theme dark
         set newtab about:blank

         set smoothscroll true
         bind j scrollline 5
         bind k scrollline -5

         unbind <C-f>

         " remove all default searchurls
         jsb Object.keys(tri.config.get("searchurls")).reduce((prev, u) => prev.then(_ => tri.config.set("searchurls", u, null)), Promise.resolve())

         set searchurls.searx https://searx.tiekoetter.com/search?q=%s
         set searchurls.nixpkgs https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%s
         set searchurls.nixopts https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%s
         set searchurls.nixwiki https://nixos.wiki/index.php?search=%s
         set searchurls.archwiki https://wiki.archlinux.org/index.php?search=%s
      '';
   };
}
