{ config, lib, pkgs, ... }: {

    programs.home-manager.enable = true;

    xdg.configFile = import ./xdgMap.nix config [
        "hammerspoon"
        "nvim"
        "tmux"
        "wezterm"
    ];

    home = {
        packages = with pkgs; [ 
            bottom
            fnm
            jq
            tmux
            wezterm
        ];
        stateVersion = "23.05";
    };

    programs.awscli = { enable = true; };

    programs.bun = { 
        enable = true;
        enableGitIntegration = false;
    };

    programs.eza = { enable = true; };
    
    programs.fd = { enable = true; };

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
    
    programs.git = {
        enable = true;
        userName = "Danny Wray";
        userEmail = "48837241+dannywrayuk@users.noreply.github.com";
        extraConfig = {
            core = {
                editor = "nvim";
                autocrlf = "input";
            };
            push = {
                autoSetupRemote = true;
            };
            pull = {
                rebase = true;
            };
            advice = {
                statusHints = false;
            };
            credential = {
                helper = [
                    "cache --timeout 21600"
                    "oauth"
                ];
            };
        };
    };

    programs.git-credential-oauth = { enable = true; };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };
    
    programs.ripgrep = { enable = true; };
    
    programs.tmux = {
        enable = true;
    };
}
