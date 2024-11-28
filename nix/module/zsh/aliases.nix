{
    ls = "ls -G";
    ":q"="exit";
    "~" = "cd ~";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    proj="cd $PROJ_DIR/\$(ls $PROJ_DIR | fzf)";
    vim="nvim";
    viml="nvim -c \"'0\"";
    lofi="open https://www.youtube.com/watch\?v\=jfKfPfyJRdk";
    ph="vim +$ $HOME/.pasteboardHistory";
    ch="vim +$ $CONFIG_DIR/zsh/zsh_history";
    switch="darwin-rebuild switch --flake path:$SYS_CONFIG_DIR/nix && source $CONFIG_DIR/zsh/.zshrc";
    yz="yazi";
} 
