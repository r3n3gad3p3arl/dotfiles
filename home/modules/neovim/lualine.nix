{
  programs.nixvim = {
    opts.showmode = false;

    plugins.lualine = {
      extensions = [ "man" ];
      globalstatus = true;
      componentSeparators = { left = "|"; right = "|"; };
      sectionSeparators = { left = ""; right = ""; };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [{ name = "branch"; icon = "󰘬"; }];

        lualine_c = [
          "diagnostics"
          { name = "filetype"; separator = { left = ""; right = ""; }; padding = { left = 1; right = 0; }; extraConfig = { icon_only = true; }; }
        { name = "filename"; extraConfig = { path = 1; }; }
        ];

        lualine_x = [ "diff" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
