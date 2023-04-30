{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "22.11"; 

  home.packages = with pkgs; [
    vim
    vimPlugins.vim-plug
    neovim
    python311Full
    python311Packages.pip
    python311Packages.pipx
    python311Packages.argcomplete
    nodejs
    go
    gnumake
    cargo
    gcc

    openvpn

    vivaldi
    vivaldi-ffmpeg-codecs
    obsidian
    discord

    gimp
    inkscape
    signal-desktop
    libreoffice-fresh
    transmission
    vlc

    fish
    zsh
    git
    github-desktop
    gnome.gnome-shell
    gnome.gnome-shell-extensions
    gnome-extension-manager

    orchis-theme
    nerdfonts
    gnomeExtensions.dash-to-dock
    gnomeExtensions.system-monitor
    gnomeExtensions.arcmenu
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnome.gnome-tweaks

    material-icons
    siji
    terminus_font

    gammastep
    freshfetch
    lolcat
    lsd

    kitty
    hyprpaper
    eww-wayland

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
    ];

  home.file = {
    ".config/hypr/cleanup_after_start.sh".source = ./cleanup_after_start.sh;
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
