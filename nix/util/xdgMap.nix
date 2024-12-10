config: files: builtins.listToAttrs (map
  (key: {
    name = key;
    value = {
      source = (config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/system/${key}");
    };
  })
  files)

