{ colors, ... }: {
  programs.nixvim = {
    plugins.mini = {
      modules.statusline.content.active.__raw = ''
        function()
          local MiniStatusline = require('mini.statusline')
          local MiniIcons = require('mini.icons')

          local filetype = function()
            local ft = vim.bo.filetype
            local icon = MiniIcons.get('filetype', ft)

            return string.format('%s %s', icon, ft)
          end

          local location = function(args)
            if MiniStatusline.is_truncated(args.trunc_width) then
              return ' %02l │ %02v '
            end

            return ' %02l|%02L │ %02v|%02{virtcol("$") - 1} '
          end

          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local git           = MiniStatusline.section_git({ trunc_width = 40 })
          local diff          = MiniStatusline.section_diff({ trunc_width = 75, icon = ''' })
          local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75, icon = ''',
                                signs = {
                                  ERROR = ' ', WARN = ' ', INFO = ' ', HINT = ' '
                                } })
          local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
          local location      = location({ trunc_width = 75 })
          local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
          
          return MiniStatusline.combine_groups({
            { hl = mode_hl,                  strings = { mode:upper() } },
            { hl = 'MiniStatuslineDevinfo',  strings = { git, diff } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineDevinfo',  strings = { filetype(), diagnostics } },
            { hl = mode_hl,                  strings = { search, location } },
          })
        end
      '';
    };

    opts = {
      laststatus = 3;
      showmode = false;
    };

    autoCmd = [
      {
        event = "User";
        pattern = "MiniGitUpdated";
        callback.__raw = ''
          function(data)
            local summary = vim.b[data.buf].minigit_summary
            vim.b[data.buf].minigit_summary_string = summary.head_name or '''
          end
        '';
      }
      {
        event = "User";
        pattern = "MiniDiffUpdated";
        callback.__raw = ''
          function(data)
            local summary = vim.b[data.buf].minidiff_summary
            local t = {}
            if summary.add > 0 then table.insert(t, ' ' .. summary.add) end
            if summary.change > 0 then table.insert(t, ' ' .. summary.change) end
            if summary.delete > 0 then table.insert(t, ' ' .. summary.delete) end
            vim.b[data.buf].minidiff_summary_string = table.concat(t, ' ')
          end
        '';
      }
    ];

    highlightOverride = {
      MiniStatuslineModeNormal = {
        bg = "#${colors.base0D}";
        fg = "#${colors.base00}";
      };

      MiniStatuslineModeInsert = {
        bg = "#${colors.base0B}";
        fg = "#${colors.base00}";
      };

      MiniStatuslineModeVisual = {
        bg = "#${colors.base0E}";
        fg = "#${colors.base00}";
      };

      MiniStatuslineModeReplace = {
        bg = "#${colors.base09}";
        fg = "#${colors.base00}";
      };

      MiniStatuslineModeCommand.link = "MiniStatuslineModeNormal";
      MiniStatuslineModeOther.link = "MiniStatuslineModeInsert";
    };
  };
}
