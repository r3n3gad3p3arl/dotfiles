{ lib, colors, ... }: {
  programs.nixvim = {
    plugins.mini = {
      mockDevIcons = true;
      modules = {
        icons = { };
        pairs = { };
        git = { };
        cursorword = { };
        move = { };
        indentscope.symbol = "▎";
        base16.palette = lib.mapAttrs (name: value: "#${value}") colors;
      };
    };

    opts.termguicolors = true;
    highlightOverride.MiniCursorwordCurrent.underline = false;

    autoCmd = [
      {
        event = "Filetype";
        pattern = ["help" "man"];
        callback.__raw = ''
          function(args)
            vim.b[args.buf].miniindentscope_disable = true
          end
        '';
      }
    ];
  };
}
