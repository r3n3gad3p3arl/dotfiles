{ config, ... }: {
   programs.btop.settings = {
      color_theme = config.colorScheme.slug;
      theme_background = false;
      vim_keys = true;
   };

   xdg.configFile."btop/themes/${config.colorScheme.slug}.theme" =
   let colors = config.colorScheme.colors;
   in {
      enable = config.programs.btop.enable;

      text = ''
         theme[main_bg]="#${colors.base00}"
         theme[main_fg]="#${colors.base05}"

         theme[title]="#${colors.base05}"

         theme[hi_fg]="#${colors.base0C}"

         theme[selected_bg]="#${colors.base01}"
         theme[selected_fg]="#${colors.base05}"

         theme[inactive_fg]="#${colors.base02}"

         theme[proc_misc]="#${colors.base03}"

         theme[cpu_box]="#${colors.base0D}"
         theme[mem_box]="#${colors.base0D}"
         theme[net_box]="#${colors.base0D}"
         theme[proc_box]="#${colors.base0D}"
         theme[div_line]="#${colors.base0D}"

         theme[temp_start]="#${colors.base0B}"
         theme[temp_mid]="#${colors.base0A}"
         theme[temp_end]="#${colors.base08}"

         theme[cpu_start]="#${colors.base0B}"
         theme[cpu_mid]="#${colors.base0A}"
         theme[cpu_end]="#${colors.base08}"

         theme[free_start]="#${colors.base0B}"
         theme[free_mid]="#${colors.base0A}"
         theme[free_end]="#${colors.base08}"

         theme[cached_start]="#${colors.base0B}"
         theme[cached_mid]="#${colors.base0A}"
         theme[cached_end]="#${colors.base08}"

         theme[available_start]="#${colors.base0B}"
         theme[available_mid]="#${colors.base0A}"
         theme[available_end]="#${colors.base08}"

         theme[used_start]="#${colors.base0B}"
         theme[used_mid]="#${colors.base0A}"
         theme[used_end]="#${colors.base08}"

         theme[download_start]="#${colors.base0B}"
         theme[download_mid]="#${colors.base0A}"
         theme[download_end]="#${colors.base08}"

         theme[upload_start]="#${colors.base0B}"
         theme[upload_mid]="#${colors.base0A}"
         theme[upload_end]="#${colors.base08}"
      '';
   };
}
