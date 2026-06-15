{
  flake.modules.homeManager.neovim = {
    programs.nixvim = {
      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      opts = {
        undofile = true;
        mouse = "a";
        breakindent = true;
        cursorline = true;
        linebreak = true;
        number = true;
        relativenumber = true;
        splitbelow = true;
        splitright = true;
        wrap = false;
        signcolumn = "yes";
        fillchars = "eob: ";
        ignorecase = true;
        smartcase = true;
        smartindent = true;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        confirm = true;
        scrolloff = 4;
        smoothscroll = true;
        timeoutlen = 300;
        updatetime = 200;
        pumheight = 10;
        pummaxwidth = 100;
      };

      filetype.extension.njk = "html";
    };
  };
}
