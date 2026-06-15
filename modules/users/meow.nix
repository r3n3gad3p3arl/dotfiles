{
  flake.modules.nixos.meow = {
    users.users.meow = {
      isNormalUser = true;
      initialPassword = "nixos";
      extraGroups = [
        "wheel"
        "video"
      ];
    };
  };

  flake.modules.homeManager.meow = {
    home = {
      username = "meow";
      homeDirectory = "/home/meow";
    };
  };
}
