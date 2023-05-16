{
   programs.btop = {
      enable = true;

      settings = {
         color_theme = "tomorrow-night";
         theme_background = false;
         vim_keys = true;
      };
   };

   xdg.configFile."btop/themes/tomorrow-night.theme".text = ''
      theme[main_bg]="#1d1f21"
      theme[main_fg]="#c5c8c6"

      theme[title]="#c5c8c6"

      theme[hi_fg]="#81beb7"

      theme[selected_bg]="#282a2e"
      theme[selected_fg]="#c5c8c6"

      theme[inactive_fg]="#373b41"

      theme[proc_misc]="#969896"

      theme[cpu_box]="#81a2be"
      theme[mem_box]="#81a2be"
      theme[net_box]="#81a2be"
      theme[proc_box]="#81a2be"
      theme[div_line]="#81a2be"

      theme[temp_start]="#b5bd68"
      theme[temp_mid]="#f0c674"
      theme[temp_end]="#cc6666"

      theme[cpu_start]="#b5bd68"
      theme[cpu_mid]="#f0c674"
      theme[cpu_end]="#cc6666"

      theme[free_start]="#b5bd68"
      theme[free_mid]="#f0c674"
      theme[free_end]="#cc6666"

      theme[cached_start]="#b5bd68"
      theme[cached_mid]="#f0c674"
      theme[cached_end]="#cc6666"

      theme[available_start]="#b5bd68"
      theme[available_mid]="#f0c674"
      theme[available_end]="#cc6666"

      theme[used_start]="#b5bd68"
      theme[used_mid]="#f0c674"
      theme[used_end]="#cc6666"

      theme[download_start]="#b5bd68"
      theme[download_mid]="#f0c674"
      theme[download_end]="#cc6666"

      theme[upload_start]="#b5bd68"
      theme[upload_mid]="#f0c674"
      theme[upload_end]="#cc6666"
   '';
}
