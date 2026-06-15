{
  flake.modules.homeManager.neovim = {
    programs.nixvim.plugins = {
      treesitter = {
        enable = true;

        lazyLoad.settings.event = [
          "BufReadPost"
          "BufNewFile"
          "BufWritePre"
          "DeferredUIEnter"
        ];

        settings = {
          indent.enable = true;
          folding.enable = true;
        };
      };

      ts-autotag = {
        enable = true;

        lazyLoad.settings.event = [
          "BufReadPost"
          "BufNewFile"
          "BufWritePre"
        ];
      };

      treesitter-textobjects = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";
      };
    };
  };
}
