{ pkgs, ... }: {
     programs.zsh.enable = true;
     environment.shells = [ pkgs.zsh ];
     environment.loginShell = pkgs.zsh;
     services.nix-daemon.enable = true;
     nix.extraOptions = ''
         experimental-features = nix-command flakes
     '';
 }
