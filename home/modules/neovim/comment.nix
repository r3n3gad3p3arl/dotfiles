{
  programs.nixvim.plugins.comment.settings.pre_hook = ''
    require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  '';
}
