{
  flake.modules.homeManager.keepassxc = {
    programs.keepassxc = {
      enable = true;
      autostart = true;
    };
  };
}
