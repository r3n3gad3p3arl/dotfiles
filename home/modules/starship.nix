{
  programs.starship = {
    settings = {
      add_newline = false;
      line_break.disabled = true;

      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };

      directory.read_only = " 󰌾";
      git_branch.symbol = "󰘬 ";
      hostname.ssh_symbol = " ";
      lua.symbol = "󰢱 ";
      python.symbol = "󰌠 ";
    };
  };
}
