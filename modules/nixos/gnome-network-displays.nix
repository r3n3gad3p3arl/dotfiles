{ lib, config, pkgs, ... }: with lib;
let
   cfg = config.programs.gnome-network-displays;
in {
   options.programs.gnome-network-displays.enable = mkEnableOption (mdDoc "GNOME Network Displays");

   config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [ gnome-network-displays ];

      # ports needed for connection
      networking.firewall = {
         allowedTCPPorts = [ 7236 7250 ];
         allowedUDPPorts = [ 7236 5353 ];
      };
   };
}
