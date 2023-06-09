{
  inputs,
  config,
  pkgs,
  ...
}: let
  nixpkgs-unstable = import inputs.nixpkgs-unstable {
    system = "${pkgs.system}";
    config = config.nixpkgs.config;
  };
in {
  home.packages = with pkgs; [
    aria
    p7zip
    nnn
    # erdtree isnt in stable yet
  ];

  programs.exa = {
    enable = true;
    extraOptions = [
      "--no-time"
      "--color=always"
      "--group-directories-first"
    ];
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa -l";
      tree = "ls --tree";
      lt = "tree";
      download = "aria2c --split=10";
      extract = "7z x";
      usage = "erd --human";
      files = "nnn -e -H -r";
      n = "nnn -e -H -r";
    };
    # wish they'd just remove this garbage
    interactiveShellInit = "set -U fish_greeting";
    functions = {
      md = {
        body = ''
          command mkdir $argv
          if test $status = 0
              switch $argv[(count $argv)]
                  case '-*'

                  case '*'
                      cd $argv[(count $argv)]
                      return
              end
          end
        '';
      };
    };
  };
}
