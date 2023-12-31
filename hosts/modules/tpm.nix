{ lib, config, ... }: {
  security.tpm2 = {
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };

  users.users.meow.extraGroups = lib.mkIf config.security.tpm2.enable [ "tss" ];
}
