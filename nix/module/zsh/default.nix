config: {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh"; # Must be relative to ~
    localVariables = {
        CONFIG_DIR = "${config.xdg.configHome}";
        PROJ_DIR = "$HOME/project";
        SYS_CONFIG_DIR = "${config.xdg.configHome}/system";
    };
    history = {
        expireDuplicatesFirst = true;
        ignoreDups = true;
        path = "${config.xdg.configHome}/zsh/zsh_history";
    };
    historySubstringSearch = {
        enable = true;
    };
    profileExtra = builtins.readFile ./profileExtra.zsh; 
    initExtra = builtins.readFile ./initExtra.zsh;
    shellAliases = import ./aliases.nix // import ./git-aliases.nix;
}
