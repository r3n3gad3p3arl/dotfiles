{
  programs.nixvim.plugins.lualine.settings = {
    extensions = [ "man" ];

    options = {
      globalstatus = true;
      component_separators = { left = "|"; right = "|"; };
      section_separators = { left = ""; right = ""; };
    };

    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [{ __unkeyed-1 = "branch"; icon = "󰘬"; }];

      lualine_c = [
        "diagnostics"

        {
          __unkeyed-1 = "filetype";
          separator = "";
          padding = { left = 1; right = 0; };
          icon_only = true;
        }

        { __unkeyed-1 = "filename"; path = 1; }
      ];

      lualine_x = [ "diff" ];
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
  };
}
