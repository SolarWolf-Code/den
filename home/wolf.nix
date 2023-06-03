{
  inputs,
  config,
  pkgs,
  selfpkgs,
  ...
}: {
  imports = [
    ./programs/starship.nix
    ./programs/alacritty.nix
    ./programs/direnv.nix
    ./programs/fish.nix
    ./programs/rofi.nix
    ./programs/micro.nix
    ./programs/flameshot.nix
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

        # gui
        discord
        flameshot
        gimp
        spotify
        virt-manager
	    librewolf
	    rofi
	    qview
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
