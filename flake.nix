{
   description = "meow's nixowos config";

   inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      
      home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland.url = "github:hyprwm/hyprland";
      nur.url = "github:nix-community/nur";
      nix-colors.url = "github:misterio77/nix-colors";
   };

   outputs = { self, nixpkgs, ... }@inputs:
   let
      inherit (self) outputs;
      lib = nixpkgs.lib.extend (final: prev: { meow = import ./lib; });
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
   in {
      packages.${system} = import ./pkgs { inherit pkgs; };
      overlays = import ./overlays { meowPkgs = self.packages.${system}; };

      # mostly made for my specific usecases, but you may find them useful
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
         dell-laptop = lib.nixosSystem {
            specialArgs = { inherit lib inputs outputs; };
            modules = [ ./hosts/dell-laptop ] ++ lib.meow.mapModules ./hosts/modules;
         };
      };
   };
}
