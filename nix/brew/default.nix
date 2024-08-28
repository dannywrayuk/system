let
    host = (import ../host.nix).host;
    extraCasks = {
        DannysMacbookAir = [
            "surfshark"
        ];
    };
in {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { };
    casks = [ 
        "hammerspoon"
    ] ++ (extraCasks.${host} or []);
    taps = [];
    brews = [];
}
