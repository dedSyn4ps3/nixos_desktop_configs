{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
      gnumake
      gcc
      openssl
      pkg-config
      flatpak-builder
      bottles
      vagrant
      virtualbox
      android-tools
      
      docker-compose
      distrobox
      nix-prefetch-docker
      mongodb-compass
      mongosh
      protonvpn-gui
    ];
}
