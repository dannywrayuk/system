{ config, lib, pkgs, ... }: {
    home = {
        packages = [ pkgs.bottom];
        stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
                            }

