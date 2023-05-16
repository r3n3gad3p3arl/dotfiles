{ pkgs, ... }: {
   home.packages = with pkgs; [ tofi ];

   xdg.configFile."tofi/config".text = ''
      anchor = top
      width = 100%
      height = 32
      horizontal = true
      font = Fantasque Sans Mono
      font-size = 11
      background-color = #1d1f21
      text-color = #969896
      selection-color = #c5c8c6
      selection-match-color = #cc6666
      outline-width = 0
      border-width = 0
      min-input-width = 120
      result-spacing = 15
      padding-top = 8
      padding-bottom = 0
      padding-left = 8
      padding-right = 0
      exclusive-zone = 32
      fuzzy-match = true
      terminal = alacritty
   '';
}
