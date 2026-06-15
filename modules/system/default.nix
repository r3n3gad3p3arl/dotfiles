{ inputs, ... }:
{
  flake.modules.nixos.system = {
    imports = with inputs.self.modules.nixos; [
      boot
      console
      firmware
      homeManager
      locale
      nix
      ssd
      time
      tpm
      zsh
      zswap
      neovim
      meow
    ];
  };

  flake.modules.homeManager.system = {
    imports = with inputs.self.modules.homeManager; [
      neovim
      btop
      eza
      git
      homeManager
      starship
      zsh
      meow
    ];
  };
}
