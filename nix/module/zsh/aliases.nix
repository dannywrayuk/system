{
    ls = "ls -G";
    ":q"="exit";
    "~" = "cd ~";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    proj="cd $PROJ_DIR/\$(ls $PROJ_DIR | fzf)";
    tree="eza -TL 2 --color=always --group-directories-first --icons";
    vim="nvim";
    lofi="open https://www.youtube.com/watch\?v\=jfKfPfyJRdk";
    ph="vim +$ $HOME/.pasteboardHistory";
    ch="vim +$ $CONFIG_DIR/zsh/.zsh_history";
    switch="darwin-rebuild switch --flake path:$SYS_CONFIG_DIR/nix && source $CONFIG_DIR/zsh/.zshrc";
    yz="yazi";
} 
