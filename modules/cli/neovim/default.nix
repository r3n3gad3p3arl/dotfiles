{ inputs, ... }:
{
  flake.modules.nixos.neovim = {
    home-manager.sharedModules = [ inputs.nixvim.homeModules.nixvim ];
  };

  flake.modules.homeManager.neovim = {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
    };

    home.sessionVariables.MANPAGER = "nvim +Man!";
  };
}
