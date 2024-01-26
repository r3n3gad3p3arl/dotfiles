{ lib, pkgs, config, ... }: {
  programs.nixvim = {
    plugins = {
      nvim-cmp = {
        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm{ select = true }";
          "<Tab>" = {
            action = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_locally_jumpable() then
                  require("luasnip").expand_or_jump()
                else
                  fallback()
                end
              end)
            '';

            modes = [ "i" "s" ];
          };
          "<S-Tab>" = {
            action = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").locally_jumpable(-1) then
                  require("luasnip").jump(-1)
                else
                  fallback()
                end
              end)
            '';

            modes = [ "i" "s" ];
          };
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];

        snippet.expand = "luasnip";
      };

      luasnip = {
        enable = config.programs.nixvim.plugins.nvim-cmp.enable;
        fromVscode = [{}];
      };

      nvim-autopairs = {
        enable = config.programs.nixvim.plugins.nvim-cmp.enable;
        checkTs = true;
      };
    };

    extraPlugins = lib.mkIf config.programs.nixvim.plugins.luasnip.enable (with pkgs.vimPlugins; [ friendly-snippets ]);
  };
}
