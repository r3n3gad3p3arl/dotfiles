{ config, ... }: {
  programs.nixvim.plugins = {
    treesitter = {
      lazyLoad.settings.event = ["BufReadPost" "BufNewFile" "BufWritePre" "DeferredUIEnter"];

      settings = {
        indent.enable = true;
        incrementalSelection.enable = true;
      };
    };

    ts-autotag = {
      enable = config.programs.nixvim.plugins.treesitter.enable;
      lazyLoad.settings.event = ["BufReadPost" "BufNewFile" "BufWritePre"];
    };
  };
}
