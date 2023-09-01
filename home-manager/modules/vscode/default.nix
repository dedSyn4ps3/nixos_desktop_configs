{ config, pkgs, ... }:

{
programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      bbenoist.nix
      tamasfe.even-better-toml
      rust-lang.rust-analyzer
      ms-python.python
      golang.go
      catppuccin.catppuccin-vsc
      emmanuelbeziat.vscode-great-icons
    ];
  };
}
