{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
      powershell
      git
      gitkraken
      openvpn
      nix-direnv

      orchis-theme
      lxappearance

      gnomeExtensions.dash-to-dock
      gnomeExtensions.system-monitor
      gnomeExtensions.arcmenu
      gnomeExtensions.blur-my-shell
      gnomeExtensions.just-perfection
      gnomeExtensions.rounded-window-corners
      gnomeExtensions.vitals

      gnome.gnome-tweaks
      gnome.gnome-boxes
      gnome.gnome-software
      gnome.gnome-shell
      gnome.gnome-shell-extensions
      gnome-extension-manager

      material-icons
      nerdfonts
      terminus-nerdfont
      siji

      gammastep
      freshfetch
      lolcat
      lsd

      kitty
      alacritty
      hyprpaper

      grim
      wl-clipboard
      wlogout
      libnotify
      wf-recorder
      brightnessctl
      wofi
      pcmanfm

      pulseaudio
      pavucontrol
      gparted
    ];
}
