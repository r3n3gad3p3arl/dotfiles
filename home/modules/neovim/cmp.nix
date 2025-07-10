{ config, ... }: {
  programs.nixvim.plugins = {
    blink-cmp = {
      lazyLoad.settings.event = ["InsertEnter" "CmdlineEnter"];

      settings = {
        appearance.use_nvim_cmp_as_default = true;

        completion = {
          menu.draw = {
            treesitter = ["lsp"];

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
          "<Tab>" = ["select_next" "snippet_forward" "fallback"];
          "<S-Tab>" = ["select_prev" "snippet_backward" "fallback"];
          "<Esc>" = ["cancel" "fallback"];
        };
      };
    };

    friendly-snippets.enable = config.programs.nixvim.plugins.blink-cmp.enable;
  };
}
