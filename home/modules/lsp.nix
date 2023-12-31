{lib, config, pkgs, ...}: {
  home.packages = lib.mkIf (config.programs.neovim.enable || config.programs.emacs.enable) (with pkgs; [
    lua-language-server
    python3Packages.python-lsp-server
    nixd
  ]);
}
