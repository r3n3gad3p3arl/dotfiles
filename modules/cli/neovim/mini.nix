{
  flake.modules.homeManager.neovim =
    { lib, config, ... }:
    {
      programs.nixvim = {
        plugins.mini = {
          enable = true;
          mockDevIcons = true;
          luaConfig.post = "MiniIcons.tweak_lsp_kind()";

          modules = {
            ai = { };
            icons = { };
            pairs = { };
            git = { };
            cursorword = { };
            move = { };
            bufremove = { };
            keymap = { };
            indentscope.symbol = "▎";
            base16.palette = lib.mapAttrs (name: value: "#${value}") config.colors;
          };
        };

        opts.termguicolors = true;
        highlightOverride.MiniCursorwordCurrent.underline = false;

        autoCmd = [
          {
            event = "Filetype";
            pattern = [
              "help"
              "man"
            ];
            callback.__raw = ''
              function(args)
                vim.b[args.buf].miniindentscope_disable = true
              end
            '';
          }
        ];
      };
    };
}
