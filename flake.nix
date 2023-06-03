{
  description = "nixos configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nh.url = "github:ViperML/nh";
    nix_search = {
      url = "github:peterldowns/nix-search-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    agenix = {
          url = "github:ryantm/agenix";
          inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
            # remove for darwin support
            darwin.follows = "";
          };
      };
  };

  outputs = {
    nixpkgs,
    home-manager,
    agenix,
    ...
  } @ inputs: rec {
    devShells.x86_64-linux = {
      default = let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
        pkgs.mkShell {
          name = "wolf-den";
          packages = with pkgs; [
            alejandra
            just
            deadnix
            rnix-lsp
            nvfetcher
            inputs.nh.packages.x86_64-linux.default
          ];
        };
    };

    nixosConfigurations = {
      wolf-nix = nixpkgs.lib.nixosSystem {
      	pkgs = nixpkgs.legacyPackages.x86_64-linux;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./nixos/configuration.nix
          agenix.nixosModules.default
        ];
      };
    };


    homeConfigurations = {
      "wolf@wolf-nix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home/wolf.nix
        ];
      };
   };
 };
}
