{ inputs, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    configDir = ./config;
    extraPackages = with pkgs; [ libdbusmenu-gtk3 ];
  };
}
