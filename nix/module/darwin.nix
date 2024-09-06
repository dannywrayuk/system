{ pkgs, ... }: {
    programs.zsh.enable = true;

    environment = {
        shells = [ pkgs.zsh ];
        loginShell = pkgs.zsh;
        etc.hushlogin.enable = true;
        etc."pam.d/sudo_local" = {
          text = ''
            auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so
            auth       sufficient     pam_tid.so
          '';
        };
    };

    services.nix-daemon.enable = true;

    system = {
        defaults = {
            dock = {
                autohide = true;
                show-recents = false;
                persistent-apps = [
                    "/Applications/Firefox.app"
                    "/Applications/WezTerm.app"
                ];
            };
            finder = {
                AppleShowAllExtensions = true;
                AppleShowAllFiles = true;
                FXDefaultSearchScope = "SCcf";
                FXEnableExtensionChangeWarning = false;
                ShowPathbar = true;
            };
            NSGlobalDomain = {
                AppleInterfaceStyle = "Dark";
                InitialKeyRepeat = 14;
                KeyRepeat = 1;
            };
            CustomUserPreferences = {
                "org.hammerspoon.Hammerspoon" = {
                    MJConfigFile = "~/.config/hammerspoon/init.lua";
                };
            };
        };
        keyboard = {
            enableKeyMapping = true;
            remapCapsLockToControl = true;
        };
    }; 


    nix.extraOptions = ''
        experimental-features = nix-command flakes
        '';

    fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; }) ];

    homebrew = import ./brew.nix;
}
