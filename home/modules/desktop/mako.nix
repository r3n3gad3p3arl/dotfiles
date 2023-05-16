{ pkgs, ... }: {
   home.packages = with pkgs; [ libnotify ];

   services.mako = {
      enable = true;
      backgroundColor = "#1d1f21";
      textColor = "#c5c8c6";
      borderColor = "#969896";
      progressColor = "over #969896";
      borderSize = 1;
      borderRadius = 4;
      defaultTimeout = 5000;
      font = "Fantasque Sans Mono 11";
      layer = "overlay";
      margin = "12";
      padding = "8";
   };
}
