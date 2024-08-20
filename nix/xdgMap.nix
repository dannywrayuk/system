config: files: builtins.listToAttrs (map
    (key: { 
        name = key;
        value = { 
            source = (config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/${key}");
        };
    })
    files)

