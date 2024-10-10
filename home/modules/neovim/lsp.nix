{
  programs.nixvim.plugins.lsp = {
    keymaps = {
      diagnostic = {
        "[d" = "goto_prev";
        "]d" = "goto_next";
        "<leader>e" = "open_float";
        "<leader>q" = "setloclist";
      };

      lspBuf = {
        "<leader>rn" = "rename";
        "<leader>ca" = "code_action";
        "K" = "hover";
        "<C-k>" = "signature_help";
        "gD" = "declaration";
        "<leader>sa" = "add_workspace_folder";
        "<leader>sr" = "remove_workspace_folder";
      };
    };

    servers = {
      nixd.enable = true;
      pylsp.enable = true;
      lua_ls.enable = true;
      ts_ls.enable = true;
      cssls.enable = true;
      html.enable = true;
    };
  };
}
