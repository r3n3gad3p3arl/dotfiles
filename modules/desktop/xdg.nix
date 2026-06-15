{
  flake.modules.homeManager.xdg = {
    xdg = {
      enable = true;
      autostart.enable = true;

      userDirs = {
        enable = true;
        createDirectories = true;
        setSessionVariables = true;
      };
    };
  };
}
