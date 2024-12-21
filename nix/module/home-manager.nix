{ config, lib, pkgs, ... }:
let
  sys-vars = import ../util/system-variables.nix;
in
{

  programs.home-manager.enable = true;

  xdg.configFile = import ../util/xdgMap.nix config [
    "hammerspoon"
    "nvim"
    "terminal"
    "wezterm"
  ];

  home = {
    packages = with pkgs; [
      awscli2
      bottom
      bun
      fd
      fnm
      git-credential-manager
      pam-reattach
      jq
      ripgrep
      rustup
      wezterm
    ];

    sessionPath = [
      "/opt/homebrew/bin"
      "/Users/${sys-vars.user}/.cargo/bin"
      "${config.xdg.configHome}/terminal/commands"
    ];
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
  };

  programs = {
    fzf = import ./fzf.nix;
    git = import ./git.nix pkgs;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    zsh = import ./zsh config;
  };
}
