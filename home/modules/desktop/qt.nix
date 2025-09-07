{ lib, config, colors, ... }: {
  qt = {
    style.name = "breeze";
    platformTheme.name = "qtct";
  };

  xdg = {
    configFile = {
      "qt6ct/qt6ct.conf".text = lib.generators.toINI {} {
        Appearance = {
          color_scheme_path = "${config.xdg.configHome}/qt6ct/style-colors.conf";
          custom_palette = true;
          icon_theme = config.gtk.iconTheme.name;
          standard_dialogs = "default";
          style = "breeze";
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

      # "qt6ct/colors/base16.conf".text = lib.generators.toINI {} {
      #   ColorScheme = {      # window text        # button bg          # bright             # less bright        # dark               # less dark          # normal text        # bright text        # button text        # normal bg          # window             # shadow             # highlight          # hightlight text    # link               # visited link       # alt bg             # default            # tooltip bg         # tooltip text       # placeholder text   # accent
      #     active_colors =   "#ff${colors.base05}, #ff${colors.base01}, #ff${colors.base01}, #ff${colors.base05}, #ff${colors.base03}, #ff${colors.base04}, #ff${colors.base05}, #ff${colors.base06}, #ff${colors.base05}, #ff${colors.base01}, #ff${colors.base00}, #ff${colors.base03}, #ff${colors.base0D}, #ff${colors.base00}, #ff${colors.base0D}, #ff${colors.base04}, #ff${colors.base02}, #ff${colors.base07}, #ff${colors.base01}, #ff${colors.base05}, #8f${colors.base05}, #ff${colors.base0D}";
      #     disabled_colors = "#ff${colors.base04}, #ff${colors.base01}, #ff${colors.base01}, #ff${colors.base05}, #ff${colors.base03}, #ff${colors.base04}, #ff${colors.base04}, #ff${colors.base05}, #ff${colors.base04}, #ff${colors.base01}, #ff${colors.base00}, #ff${colors.base03}, #ff${colors.base0D}, #ff${colors.base01}, #ff${colors.base0D}, #ff${colors.base04}, #ff${colors.base02}, #ff${colors.base07}, #ff${colors.base01}, #ff${colors.base04}, #8f${colors.base05}, #ff${colors.base0D}";
      #     inactive_colors = "#ff${colors.base05}, #ff${colors.base01}, #ff${colors.base01}, #ff${colors.base05}, #ff${colors.base03}, #ff${colors.base04}, #ff${colors.base05}, #ff${colors.base06}, #ff${colors.base05}, #ff${colors.base01}, #ff${colors.base00}, #ff${colors.base03}, #ff${colors.base0D}, #ff${colors.base00}, #ff${colors.base0D}, #ff${colors.base04}, #ff${colors.base02}, #ff${colors.base07}, #ff${colors.base01}, #ff${colors.base05}, #8f${colors.base05}, #ff${colors.base0D}";
      #   };
      # };

      # [TODO] make it actually follow base16 colors - convert hex to rgb
      "kdeglobals".text = ''
        [ColorEffects:Disabled]
        Color=56,56,56
        ColorAmount=0
        ColorEffect=0
        ContrastAmount=0.65000000000000002
        ContrastEffect=1
        IntensityAmount=0.10000000000000001
        IntensityEffect=2

        [ColorEffects:Inactive]
        ChangeSelectionColor=true
        Color=112,111,110
        ColorAmount=0.025000000000000001
        ColorEffect=2
        ContrastAmount=0.10000000000000001
        ContrastEffect=2
        Enable=false
        IntensityAmount=0
        IntensityEffect=0


        [Colors:Button]
        BackgroundAlternate=29,31,33
        BackgroundNormal=29,31,33
        DecorationFocus=129,162,190
        DecorationHover=129,162,190
        ForegroundActive=181,189,104
        ForegroundInactive=197,200,198
        ForegroundLink=129,162,190
        ForegroundNegative=163,104,90
        ForegroundNeutral=197,200,198
        ForegroundNormal=224,224,224
        ForegroundPositive=138,190,183
        ForegroundVisited=178,148,187

        [Colors:Selection]
        BackgroundAlternate=129,162,190
        BackgroundNormal=129,162,190
        DecorationFocus=129,162,190
        DecorationHover=129,162,190
        ForegroundActive=181,189,104
        ForegroundInactive=40,42,46
        ForegroundLink=129,162,190
        ForegroundNegative=163,104,90
        ForegroundNeutral=197,200,198
        ForegroundNormal=40,42,46
        ForegroundPositive=138,190,183
        ForegroundVisited=178,148,187

        [Colors:Tooltip]
        BackgroundAlternate=29,31,33
        BackgroundNormal=29,31,33
        DecorationFocus=129,162,190
        DecorationHover=129,162,190
        ForegroundActive=181,189,104
        ForegroundInactive=197,200,198
        ForegroundLink=129,162,190
        ForegroundNegative=163,104,90
        ForegroundNeutral=197,200,198
        ForegroundNormal=224,224,224
        ForegroundPositive=138,190,183
        ForegroundVisited=178,148,187

        [Colors:View]
        BackgroundAlternate=29,31,33
        BackgroundNormal=29,31,33
        DecorationFocus=129,162,190
        DecorationHover=129,162,190
        ForegroundActive=181,189,104
        ForegroundInactive=197,200,198
        ForegroundLink=129,162,190
        ForegroundNegative=163,104,90
        ForegroundNeutral=197,200,198
        ForegroundNormal=224,224,224
        ForegroundPositive=138,190,183
        ForegroundVisited=178,148,187

        [Colors:Window]
        BackgroundAlternate=29,31,33
        BackgroundNormal=29,31,33
        DecorationFocus=129,162,190
        DecorationHover=129,162,190
        ForegroundActive=181,189,104
        ForegroundInactive=197,200,198
        ForegroundLink=129,162,190
        ForegroundNegative=163,104,90
        ForegroundNeutral=197,200,198
        ForegroundNormal=224,224,224
        ForegroundPositive=138,190,183
        ForegroundVisited=178,148,187

        [General]
        ColorScheme=Base16
        Name=Base16
        shadeSortColumn=true

        [KDE]
        contrast=4

        [WM]
        activeBackground=29,31,33
        activeBlend=29,31,33
        activeForeground=224,224,224
        inactiveBackground=29,31,33
        inactiveBlend=29,31,33
        inactiveForeground=197,200,198
      '';
    };
  };
}
