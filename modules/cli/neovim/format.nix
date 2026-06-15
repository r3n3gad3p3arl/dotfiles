{
  flake.modules.homeManager.neovim = {
    programs.nixvim.plugins.conform-nvim = {
      enable = true;

      lazyLoad.settings = {
        event = "BufWritePre";
        cmd = "ConformInfo";
        keys = [
          {
            __unkeyed-1 = "<leader>cf";
            __unkeyed-2 = "<cmd>lua require('conform').format()<cr>";
            mode = [
              "n"
              "x"
            ];
          }
        ];
      };

      autoInstall.enable = true;

      settings = {
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          javascript = [ "prettier" ];
          qml = [ "qmlformat" ];
        };

        default_format_opts.lsp_format = "fallback";
      };
    };
  };
}
