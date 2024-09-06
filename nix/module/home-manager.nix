{ config, lib, pkgs, ... }: {

    programs.home-manager.enable = true;

    xdg.configFile = import ../util/xdgMap.nix config [
        "hammerspoon"
        "nvim"
        "tmux"
        "wezterm"
        "terminal"
        "yazi"
    ];

    home = {
        packages = with pkgs; [ 
            awscli
            bottom
            bun
            fd
            fnm
            git-credential-manager
            pam-reattach
            jq
            ripgrep
            tmux
            wezterm
            yazi
        ];
        
        sessionPath = [
            "/opt/homebrew/bin"
            "${config.xdg.configHome}/terminal/scripts"
        ];
        stateVersion = "24.05";
    };

    programs = {
        fzf = import ./fzf.nix;
        git = import ./git.nix; 
        neovim = {
            enable = true;
            defaultEditor = true;
        };
        zsh = import ./zsh config;
    };
}
