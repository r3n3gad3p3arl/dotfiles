{
  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;

      keymaps = [
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gr";
          lspBufAction = "references";
        }
        {
          key = "gI";
          lspBufAction = "implementation";
        }
        {
          key = "gy";
          lspBufAction = "type_definition";
        }
        {
          key = "gD";
          lspBufAction = "declaration";
        }
        {
          key = "<leader>ca";
          lspBufAction = "code_action";
          mode = ["n" "v"];
        }
        {
          key = "<leader>cr";
          lspBufAction = "rename";
        }
      ];

      servers = {
        nixd = {
          enable = true;

          settings = {
            nixpkgs.expr = "import (builtins.getFlake \"/home/meow/.config/nixos\").inputs.nixpkgs { }";

            options = {
              nixos.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.dell-laptop.options";
              home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.dell-laptop.options.home-manager.users.type.getSubOptions []";
            };
          };
        };

        basedpyright.enable = true;
        vtsls.enable = true;
        html.enable = true;
        cssls.enable = true;
        qmlls.enable = true;
      };
    };

    diagnostic.settings = {
      virtual_text.prefix = "";

      signs.text = {
        "__rawKey__vim.diagnostic.severity.ERROR" = " ";
        "__rawKey__vim.diagnostic.severity.WARN" = " ";
        "__rawKey__vim.diagnostic.severity.INFO" = " ";
        "__rawKey__vim.diagnostic.severity.HINT" = " ";
      };
    };

    plugins.lspconfig.lazyLoad.settings.event = ["BufReadPost" "BufNewFile" "BufWritePre"];
  };
}
