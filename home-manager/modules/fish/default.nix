{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -g theme_display_nix yes
      set -g theme_color_scheme base16-dark
      set -g theme_newline_cursor yes
      set -g theme_newline_prompt '-> '
      set -g theme_display_docker_machine yes
      set -g theme_display_user yes
      set -g theme_display_hostname yes

      set PATH $PATH /home/user/.local/bin
      export NIXPKGS_ALLOW_UNFREE=1
      export NIXPKGS_ALLOW_INSECURE=1
    '';
    plugins = with pkgs; [
      { name = "colored-man-pages"; src = fishPlugins.colored-man-pages.src; } 
      { name = "bobthefish"; src = fishPlugins.bobthefish.src; } 
      { name = "foreign-env"; src = fishPlugins.foreign-env.src; } 
    ];
    shellAliases = {
      l="lsd -l";
      ll="lsd -al";
      ncu="sudo nix-channel --update";
      nfu="nix flake update";
      hms="home-manager switch --flake '.config/home-manager#user' --impure";
      nrs="sudo nixos-rebuild switch";
      nrsu="sudo nixos-rebuild switch --upgrade";
      ns="nix-shell -p";
    };
    shellAbbrs = {
      g = "git";
    };
  };
}
