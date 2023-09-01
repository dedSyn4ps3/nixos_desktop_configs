{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting = {
      enable = true;
    };
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.config/oh-my-zsh";
      plugins = [ 
        "git" 
        "python" 
        "golang" 
        "direnv"
        "nix-shell"
        "nix-zsh-completions"
      ];
      theme = "powerlevel10k/powerlevel10k";
    };
    initExtra = ''
      export PATH="/home/user/.local/bin:$PATH"
      source ~/.config/oh-my-zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
      source ~/.config/home-manager/modules/zsh/p10k.zsh
      prompt_nix_shell_setup
    '';
    shellAliases = {
      l="lsd -l";
      ll="lsd -al";
      gdev="nix develop ~/.config/home-manager#devShells.goDev -c zsh";
      ncu="sudo nix-channel --update";
      nfu="nix flake update";
      hms="home-manager switch --flake '.config/home-manager#user' --impure";
      nre="sudo nvim /etc/nixos/configuration.nix";
      nrs="sudo nixos-rebuild switch";
      nrsu="sudo nixos-rebuild switch --upgrade";
      ns="nix-shell -p";
    };
  };

  home.packages = with pkgs; [
     zsh-fast-syntax-highlighting
     nix-zsh-completions
     zsh-nix-shell
  ];
}
