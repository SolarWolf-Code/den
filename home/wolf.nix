{
  inputs,
  config,
  pkgs,
  selfpkgs,
  ...
}: {
  imports = [
    ./programs/starship/starship.nix
    ./programs/alacritty/alacritty.nix
    ./programs/direnv/direnv.nix
    ./programs/fish/fish.nix
    ./programs/rofi/rofi.nix
    ./programs/micro/micro.nix
	./wallpaper.nix
    ./programs/flameshot/flameshot.nix
    ./programs/dunst/dunst.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # NOTE: if switching from plasma consider adding handlr to handle default apps

  home = {
    username = "wolf";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.05";
    packages = with pkgs;
      [
        # cli
        feh
        htop
        neofetch
        magic-wormhole
    	picom
		pavucontrol
		handlr

        # gui
        discord
        flameshot
        gimp
        spotify
        virt-manager
	    librewolf
	    rofi
	    qview
	    spotify
	    virt-manager
	    steam
	    #jetbrains.clion
	    #jetbrains.idea-ultimate
	    #rustdesk
	    lutris
	    libreoffice
	    vlc
	    obs-studio
		blueberry
		dunst
      ]
      ++ [
        inputs.nh.packages.${pkgs.system}.default
        inputs.nix_search.packages.${pkgs.system}.default
      ];
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  xdg.enable = true;

  programs.home-manager.enable = true;
}
