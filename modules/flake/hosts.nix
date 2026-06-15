{ inputs, ... }:
{
  flake.nixosConfigurations = {
    dell-laptop = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.modules.nixos.dell-laptop
      ];
    };
  };
}
