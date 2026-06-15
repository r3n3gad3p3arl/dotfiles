{
  flake.modules.homeManager.neovim = {
    programs.nixvim = {
      lsp = {
        inlayHints.enable = true;

        keymaps = [
          {
            key = "<leader>cd";
            lspBufAction = "definition";
          }
          {
            key = "<leader>cR";
            lspBufAction = "references";
          }
          {
            key = "<leader>ci";
            lspBufAction = "implementation";
          }
          {
            key = "<leader>ct";
            lspBufAction = "type_definition";
          }
          {
            mode = [
              "n"
              "v"
            ];
            key = "<leader>ca";
            lspBufAction = "code_action";
          }
          {
            key = "<leader>cr";
            lspBufAction = "rename";
          }
        ];

        servers = {
          nixd = {
            enable = true;

            config = {
              cmd = [ "nixd" ];
              filetypes = [ "nix" ];
              root_markers = [
                "flake.nix"
                ".git"
              ];

              settings.nixd = {
                nixpkgs.expr = "import (builtins.getFlake \"/home/meow/.config/nixos\").inputs.nixpkgs { }";

                options = rec {
                  nixos.expr = "(builtins.getFlake \"/home/meow/.config/nixos\").nixosConfigurations.dell-laptop.options";
                  home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions []";
                  nixvim.expr = "(${home-manager.expr}).programs.nixvim.type.getSubOptions []";
                };
              };
            };
          };

          basedpyright.enable = true;
          vtsls.enable = true;
          html.enable = true;
          cssls.enable = true;
          jdtls.enable = true;
          qmlls.enable = true;
          lua_ls.enable = true;
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

      plugins.lspconfig = {
        enable = true;

        lazyLoad.settings.event = [
          "BufReadPre"
          "BufNewFile"
        ];
      };
    };
  };
}
