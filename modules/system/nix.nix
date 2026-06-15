{ inputs, ... }:
{
  flake.modules.nixos.nix =
    { pkgs, ... }:
    {
      nix = {
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];

          auto-optimise-store = true;
        };

        package = pkgs.lixPackageSets.latest.lix;
      };

      nixpkgs = {
        config.allowUnfree = true;

        overlays = [
          inputs.nur.overlays.default
        ];
      };

      system.stateVersion = "23.05";
    };
}
