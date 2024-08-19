{ config, lib, pkgs, ... }: {
    
    home = {
        packages = with pkgs; [ 
            bottom
            awscli
            bun
            eza
            fd
            fnm
            fzf
            git-credential-manager
            jq
            neovim
            ripgrep
            tmux
            wezterm
        ];
        stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
                            }

