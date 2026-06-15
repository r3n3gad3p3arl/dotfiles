{
  flake.modules.homeManager.neovim = {
    programs.nixvim.plugins = {
      blink-cmp = {
        enable = true;

        lazyLoad.settings.event = [
          "InsertEnter"
          "CmdlineEnter"
        ];

        settings = {
          appearance.use_nvim_cmp_as_default = true;

          completion = {
            menu.draw = {
              treesitter = [ "lsp" ];

              components.kind_icon.text.__raw = ''
                function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end
              '';
            };

            documentation = {
              auto_show = true;
              auto_show_delay_ms = 200;
            };

            list.selection.preselect = false;
          };

          keymap = {
            preset = "enter";
            "<Tab>" = [
              "select_next"
              "snippet_forward"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "snippet_backward"
              "fallback"
            ];
            "<Esc>" = [
              "cancel"
              "fallback"
            ];
          };

          snippets.preset = "mini_snippets";
          cmdline.completion.list.selection.preselect = false;
        };
      };

      mini.modules.snippets = {
        snippets.__unkeyed-1.__raw =
          let
            latex_patterns = "{ 'latex/**/*.json', '**/latex.json' }";
          in
          ''
            require('mini.snippets').gen_loader.from_lang({
              lang_patterns = {
                tex = ${latex_patterns},
                plaintex = ${latex_patterns},
                markdown_inline = { 'markdown.json' },
              }
            })
          '';
      };

      friendly-snippets.enable = true;
    };
  };
}
