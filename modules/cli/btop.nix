{
  flake.modules.homeManager.btop =
    { config, ... }:
    {
      programs.btop = {
        enable = true;

        settings = {
          color_theme = "base16";
          theme_background = false;
          vim_keys = true;
          clock_format = "%I:%M %p";
        };

        themes.base16 = ''
          theme[main_bg]="#${config.colors.base00}"
          theme[main_fg]="#${config.colors.base05}"

          theme[title]="#${config.colors.base05}"

          theme[hi_fg]="#${config.colors.base0C}"

          theme[selected_bg]="#${config.colors.base01}"
          theme[selected_fg]="#${config.colors.base05}"

          theme[inactive_fg]="#${config.colors.base02}"

          theme[proc_misc]="#${config.colors.base03}"

          theme[cpu_box]="#${config.colors.base0D}"
          theme[mem_box]="#${config.colors.base0D}"
          theme[net_box]="#${config.colors.base0D}"
          theme[proc_box]="#${config.colors.base0D}"
          theme[div_line]="#${config.colors.base0D}"

          theme[temp_start]="#${config.colors.base0B}"
          theme[temp_mid]="#${config.colors.base0A}"
          theme[temp_end]="#${config.colors.base08}"

          theme[cpu_start]="#${config.colors.base0B}"
          theme[cpu_mid]="#${config.colors.base0A}"
          theme[cpu_end]="#${config.colors.base08}"

          theme[free_start]="#${config.colors.base0B}"
          theme[free_mid]="#${config.colors.base0A}"
          theme[free_end]="#${config.colors.base08}"

          theme[cached_start]="#${config.colors.base0B}"
          theme[cached_mid]="#${config.colors.base0A}"
          theme[cached_end]="#${config.colors.base08}"

          theme[available_start]="#${config.colors.base0B}"
          theme[available_mid]="#${config.colors.base0A}"
          theme[available_end]="#${config.colors.base08}"

          theme[used_start]="#${config.colors.base0B}"
          theme[used_mid]="#${config.colors.base0A}"
          theme[used_end]="#${config.colors.base08}"

          theme[download_start]="#${config.colors.base0B}"
          theme[download_mid]="#${config.colors.base0A}"
          theme[download_end]="#${config.colors.base08}"

          theme[upload_start]="#${config.colors.base0B}"
          theme[upload_mid]="#${config.colors.base0A}"
          theme[upload_end]="#${config.colors.base08}"
        '';
      };
    };
}
