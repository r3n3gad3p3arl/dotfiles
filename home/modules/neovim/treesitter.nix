{ pkgs, ... }: {
  programs.nixvim.plugins.treesitter = {
    indent = true;
    incrementalSelection.enable = true;
  };
}
