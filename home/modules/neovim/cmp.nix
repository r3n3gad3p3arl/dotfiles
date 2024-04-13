{ lib, pkgs, config, ... }: {
  programs.nixvim = {
    plugins = {
      cmp.settings = {
        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm{ select = true }";
          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_locally_jumpable() then
                require("luasnip").expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" })
          '';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").locally_jumpable(-1) then
                require("luasnip").jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];

        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      };

      luasnip = {
        enable = config.programs.nixvim.plugins.cmp.enable;
        fromVscode = [{}];
      };

      nvim-autopairs = {
        enable = config.programs.nixvim.plugins.cmp.enable;
        settings.check_ts = true;
      };
    };

    extraPlugins = lib.mkIf config.programs.nixvim.plugins.luasnip.enable (with pkgs.vimPlugins; [ friendly-snippets ]);
  };
}
