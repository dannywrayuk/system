{ pkgs, ... }: {
    programs.zsh.enable = true;

    environment.shells = [ pkgs.zsh ];
    environment.loginShell = pkgs.zsh;

    services.nix-daemon.enable = true;

    security.pam.enableSudoTouchIdAuth = true;

    system.defaults.CustomUserPreferences = {
        "org.hammerspoon.Hammerspoon" = {
            MJConfigFile = "~/.config/hammerspoon/init.lua";
        };
    };

    nix.extraOptions = ''
        experimental-features = nix-command flakes
        '';

    fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; }) ];

    homebrew = {
        enable = true;
        caskArgs.no_quarantine = true;
        global.brewfile = true;
        masApps = { };
        casks = [ 
            "hammerspoon"
            # "firefox"
        ];
        taps = [];
        brews = [];
    };
}
