{ config, pkgs, ...}: 
{
  imports = [
    ./home.nix
    ./dev.nix
    ./system.nix
  ];
}
