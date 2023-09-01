{ config, pkgs, ...}: 
{
  imports = [
    ./waybar
    ./fish
    ./vscode
    ./zsh
  ];
}
