{
   programs.starship = {
      enable = true;

      settings = {
         add_newline = false;
         line_break.disabled = true;

         character = {
            success_symbol = "[>](bold green)";
            error_symbol = "[>](bold red)";
            vimcmd_symbol = "[<](bold green)";
         };

         battery = {
            full_symbol = " ";
            charging_symbol = " ";
            discharging_symbol = " ";
            unknown_symbol = " ";
            empty_symbol = " ";
         };

         git_branch.symbol = " ";
         python.symbol = " ";
      };
   };
}
