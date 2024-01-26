{
  programs.nixvim.plugins.telescope = {
    keymaps = {
      "<leader>," = "buffers";
      "<leader>fb" = "buffers";
      "<leader>/" = "live_grep";
      "<leader>fg" = "live_grep";
      "<leader><space>" = "find_files";
      "<leader>ff" = "find_files";
      "<leader>fc" = "current_buffer_fuzzy_find";
      "<leader>fh" = "help_tags";
      "gd" = "lsp_definitions";
      "gr" = "lsp_references";
      "gI" = "lsp_implementations";
      "<leader>D" = "lsp_type_definitions";
      "<leader>ds" = "lsp_document_symbols";
      "<leader>ss" = "lsp_dynamic_workspace_symbols";
    };

    extensions.fzf-native.enable = true;
  };
}
