{
  description = "Home Manager configuration for user";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        hyprland.homeManagerModules.default
        {
          wayland.windowManager.hyprland = {
            enable = true;
            package = hyprland.packages.${pkgs.system}.default.override {
              nvidiaPatches = true;
            };
            systemdIntegration = true;
            extraConfig = builtins.readFile ./hyprland.conf;
          };
        }
        
        ./home.nix
        ./vscode.nix
      ];

    };

    nixosConfigurations.user = nixpkgs.lib.nixosSystem {
      modules = [
        hyprland.nixosModules.default
        {
          programs.hyprland = {
            enable = true;
            package = hyprland.packages.${pkgs.system}.default.override {
              nvidiaPatches = true;
            };
            systemdIntegration = true;
            extraConfig = builtins.readFile ./hyprland.conf;
          };
        }
      ];
    };
  };
}
