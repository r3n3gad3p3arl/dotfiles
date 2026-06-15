{
  flake.modules.nixos.tpm = {
    security.tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };

    users.users.meow.extraGroups = [ "tss" ];
  };
}
