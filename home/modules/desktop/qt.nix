{ lib, pkgs, config, ... }: {
  qt = {
    style.name = "kvantum";
    platformTheme.name = "qtct";
  };

  xdg.configFile = {
    "qt6ct/qt6ct.conf".text = lib.generators.toINI {} {
      Appearance = {
        color_scheme_path = "${config.xdg.configHome}/qt6ct/style-colors.conf";
        custom_palette = true;
        icon_theme = config.gtk.iconTheme.name;
        standard_dialogs = "default";
        style = "kvantum-dark";
      };

      Fonts = {
        fixed = "${builtins.elemAt config.fonts.fontconfig.defaultFonts.monospace 0},11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        general = "${builtins.elemAt config.fonts.fontconfig.defaultFonts.sansSerif 0},11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      };

      Interface = {
        activate_item_on_single_click = 1;
        buttonbox_layout = 0;
        cursor_flash_time = 1000;
        dialog_buttons_have_icons = 1;
        double_click_interval = 400;
        gui_effects = "@Invalid()";
        keyboard_scheme = 2;
        menus_have_icons = true;
        show_shortcuts_in_context_menus = true;
        stylesheets = "@Invalid()";
        toolbutton_style = 4;
        underline_shortcut = 1;
        wheel_scroll_lines = 3;
      };

      Troubleshooting = {
        force_raster_widgets = 1;
        ignored_applications = "@Invalid()";
      };
    };

    "Kvantum/kvantum.kvconfig".text = lib.generators.toINI {} {
      General.theme = "ColloidDark";
    };

    "Kvantum/Colloid".source = "${pkgs.colloid-kde}/share/Kvantum/Colloid";
  };
}
