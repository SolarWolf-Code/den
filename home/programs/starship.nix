{
  inputs,
  pkgs,
  config,
  ...
}: let
  # TODO: remove this when the version in nixpkgs updates
  nixpkgs-unstable = import inputs.nixpkgs-unstable {
    system = "${pkgs.system}";
    config = config.nixpkgs.config;
  };
in {
  # every shell uses this
  home.file.".config/starship.toml".source = ./../starship.toml;
  programs.starship = {
    enable = true;
    # we need the latest version for the `heuristic` setting
    package = nixpkgs-unstable.starship;
  };
}
