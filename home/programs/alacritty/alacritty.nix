{...}: {
  home.file.".config/alacritty/catppuccin".source = ./catppuccin;
  programs.alacritty = {
    enable = true;
    # https://github.com/alacritty/alacritty/blob/master/alacritty.yml
    settings = {
      import = ["~/.config/alacritty/catppuccin/catppuccin-mocha.yml"];
    };
  };
}
