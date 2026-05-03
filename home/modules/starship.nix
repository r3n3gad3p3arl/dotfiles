{
  programs.starship = {
    presets = [ "nerd-font-symbols" ];

    settings = {
      add_newline = false;
      line_break.disabled = true;

      git_status = {
        deleted = "";
      };
    };
  };
}
