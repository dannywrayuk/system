default: system: config: {
        "${system.host}" =  (config.${system.host} or config.${default});
}
