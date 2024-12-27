{ config, ... }: {
  xdg.configFile = {
    "tridactyl/tridactylrc" = {
      enable = config.programs.firefox.enable;

      text = ''
        sanitize tridactyllocal

        " colors --url https://github.com/tridactyl/base16-tridactyl/raw/master/base16-${config.scheme.slug}.css ${config.scheme.slug}
        colors custom
        set newtab about:blank
        set editorcmd footclient nvim

        set smoothscroll true
        bind j scrollline 5
        bind k scrollline -5

        unbind <C-f>

        " remove all default searchurls
        jsb Object.keys(tri.config.get("searchurls")).reduce((prev, u) => prev.then(_ => tri.config.set("searchurls", u, null)), Promise.resolve())

        set searchurls.searx https://searx.neocities.org/?q=%s
        set searchurls.nixpkgs https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%s
        set searchurls.nixopts https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%s
        set searchurls.nixwiki https://nixos.wiki/index.php?search=%s
        set searchurls.youtube https://www.youtube.com/results?search_query=%s
      '';
    };

    "tridactyl/themes/custom.css" =
    let
      colors = config.scheme.withHashtag;
    in {
      enable = config.programs.firefox.enable;

      text = ''
        :root {
          --base00: ${colors.base00};
          --base01: ${colors.base01};
          --base02: ${colors.base02};
          --base03: ${colors.base03};
          --base04: ${colors.base04};
          --base05: ${colors.base05};
          --base06: ${colors.base06};
          --base07: ${colors.base07};
          --base08: ${colors.base08};
          --base09: ${colors.base09};
          --base0A: ${colors.base0A};
          --base0B: ${colors.base0B};
          --base0C: ${colors.base0C};
          --base0D: ${colors.base0D};
          --base0E: ${colors.base0E};
          --base0F: ${colors.base0F};

          --tridactyl-bg: var(--base00);
          --tridactyl-fg: var(--base05);

          --tridactyl-status-border: none;
          --tridactyl-status-border-radius: 0;

          --tridactyl-cmdl-bg: var(--base01);
          --tridactyl-cmdl-font-size: 1.25rem;

          --tridactyl-cmplt-fg: var(--base03);
          --tridactyl-cmplt-font-size: var(--tridactyl-small-font-size);
          --tridactyl-cmplt-border-top: none;
 
          --tridactyl-header-border-bottom: none;
          --tridactyl-header-font-weight: normal;

          --tridactyl-url-fg: var(--base0D);

          --tridactyl-of-bg: var(--base01);
        }

        #command-line-holder {
          order: 1;
        }

        #tridactyl-colon {
          display: none;
        }

        #tridactyl-input {
          width: 90%;
          padding: 1rem;
        }

        #completions table {
          font-size: 0.8rem;
          padding: 1rem;
          padding-top: 0;
        }

        #completions {
          order: 2;
        }

        #completions .HistoryCompletionSource {
          max-height: unset;
          min-height: unset;
        }

        #completions .BmarkCompletionSource {
          max-height: unset;
          min-height: unset;
        }

        #completions table tr td.prefix,
        #completions table tr td.privatewindow,
        #completions table tr td.container,
        #completions table tr td.icon {
          display: none;
        }

        #completions .BufferCompletionSource table {
          width: unset;
          font-size: unset;
          border-spacing: unset;
          table-layout: unset;
        }

        #completions .ExcmdCompletionOption td.excmd {
          padding-left: 0;
        }

        #completions table tr {
          text-overflow: ellipsis;
        }

        #completions .sectionHeader {
          background: unset;
          padding: 1rem !important;
          padding-left: unset;
          padding-bottom: 0.2rem;
        }

        #cmdline_iframe {
          top: 25% !important;
          left: 10% !important;
          width: 80% !important;
          box-shadow: rgba(0, 0, 0, 0.5) 0px 0px 15px !important;
        }

        .TridactylStatusIndicator {
          bottom: 0 !important;
          padding: 0.8ex !important;
        }
      '';
    };
  };
}
