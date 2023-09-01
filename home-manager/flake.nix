{
  description = "Home Manager configuration for User";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./core
        ./modules
      ];

    };

    nixosConfigurations.user = nixpkgs.lib.nixosSystem {
      modules = [
        ./core/virt.nix
      ];
    };

    devShells = {
      goDev = pkgs.mkShell {
        name = "Go Dev";
        nativeBuildInputs = with pkgs; [ go gotools gopls ];
        shellHook = ''
          echo
          tput setaf 201
          echo -e '|============================|'
          tput setaf 255
          echo -e '    Creating Go Environment    '
          tput setaf 201
          echo -e '|============================|\e[0m'
          echo
        '';
      };
    };
  };
}
