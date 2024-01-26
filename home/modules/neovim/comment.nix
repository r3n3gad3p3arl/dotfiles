{
  programs.nixvim.plugins.comment-nvim.preHook = ''
    require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  '';
}
