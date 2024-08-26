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
        colors = {
            "bg+" = "#313244";
            bg = "#1e1e2e";
            spinner = "#f5e0dc";
            hl = "#f38ba8";
            fg = "#cdd6f4";
            header = "#f38ba8";
            info = "#cba6f7";
            pointer = "#f5e0dc";
            marker = "#f5e0dc";
            "fg+" = "#cdd6f4";
            prompt = "#cba6f7";
            "hl+" = "#f38ba8";
        };
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

    programs.zsh = {
        enable = true;
        autocd = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        dotDir = ".config/zsh";
        dirHashes = {
            docs = "~/Documents";
        };
        history = {
            expireDuplicatesFirst = true;
            ignoreDups = true;
            path = "${config.xdg.dataHome}/zsh/zsh_history";
        };
        historySubstringSearch = {
            enable = true;
        };
        profileExtra = ''
            export SHELL_SESSIONS_DISABLE=1
        '';
        initExtra = ''
            autoload -U add-zsh-hook vcs_info
            add-zsh-hook precmd vcs_info
            zstyle ':vcs_info:git:*' formats '(%b)'
            setopt prompt_subst
            export PROMPT='%F{green}➜%f '
            export RPROMPT='%F{8}''${vcs_info_msg_0_} %1~ %*%f'

            eval "$(fnm env --use-on-cd)"
            
            [ -s "${config.xdg.dataHome}/zsh/.zshlocal" ] && source ${config.xdg.dataHome}/zsh/.zshlocal

            [ -z $TMUX ] && tmux new-session -A -s scratch
        '';
        shellAliases = {
            ls = "ls -G";
            ":q"="exit";
            g="git"; # Git 
            gs="git status"; # Status 
            gss="git status -s -b"; # Status short form 
            ga="git add"; # Add 
            gaa="git add --all"; # Add all 
            gc="git commit"; # Commit 
            gl="git pull"; # Pull 
            gp="git push"; # Push 
            gpf="git push --force"; # Force push 
            gco="git checkout"; # Checkout 
            gcb="git checkout -b"; # Checkout new branch 
            gcp="git -C $PROJDIR clone"; # Clone repo into project directory 
            gnuke="git clean -xdfi"; # Clear all untracked files (interactive) 
            gacp="git add --all && echo 'Commit Message: \c' && read message && git commit -m $message && git push"; # Add, Commit, Push
            ggdr="git branch -rl | grep 'origin/HEAD' | cut -d '>' -f 2 | tr -d ' '"; # Get main branch (with remote) 
            ggd="git branch -rl | grep 'origin/HEAD' | cut -d '>' -f 2 | tr -d ' ' | sed 's/origin\///' "; # Get main branch 
            grm="git fetch && git rebase -i \$(ggdr)"; # Rebase main from origin 
            gcm="git checkout \$(ggd)"; # Checkout main branch 
            # Navigation 
            "~" = "cd ~";
            ".." = "cd ..";
            "..." = "cd ../..";
            "...." = "cd ../../..";
            "....." = "cd ../../../..";
            proj="cd $PROJDIR/\$(ls $PROJDIR | fzf)";
            tree="eza -TL 2 --color=always --group-directories-first --icons";
            vim="nvim";
            lofi="open https://www.youtube.com/watch\?v\=jfKfPfyJRdk";
            ph="vim +$ ~/.pasteboardHistory";
            ch="vim +$ ~/.config/.zsh_history";
        };
    };
}
