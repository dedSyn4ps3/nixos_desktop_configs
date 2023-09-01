{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "23.11"; 

    home.packages = with pkgs; [
      vimPlugins.vim-plug
      neovim
      
      vivaldi
      vivaldi-ffmpeg-codecs
      obsidian
      discord

      bottles
      remmina
      realvnc-vnc-viewer

      gimp
      inkscape
      signal-desktop
      libreoffice-fresh
      transmission
      vlc
      bitwarden
    ];

  home.file = {};

  home.sessionVariables = {};
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
