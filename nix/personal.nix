let
  user = "danny";
  system = "aarch64-darwin";
  configHome = ".config";
  configLinks = [
    "hammerspoon"
    "nvim"
    "terminal"
    "wezterm"
  ];
  path = [
    "/opt/homebrew/bin"
    "/Users/${user}/.cargo/bin"
    "/Users/${user}/${configHome}/terminal/commands"
  ];
  settings = { pkgs, ... }: {
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        persistent-apps = [
          "/Applications/Firefox.app"
          "${pkgs.wezterm}/Applications/WezTerm.app"
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
  packages = [
    "awscli2"
    "bkt"
    "bottom"
    "bun"
    "fd"
    "fnm"
    "git-credential-manager"
    "go"
    "jq"
    "pam-reattach"
    "ripgrep"
    "rustup"
    "tree-sitter"
    "wezterm"
  ];
  casks = [
    "surfshark"
    "firefox"
    "hammerspoon"
  ];
  brews = [ ];
  programs = { pkgs, ... }: {
    neovim = {
      defaultEditor = true;
    };
    fzf = {
      enableZshIntegration = true;
      defaultOptions = [ "--color 16" ];
    };
    git = {
      userName = "Danny Wray";
      userEmail = "48837241+dannywrayuk@users.noreply.github.com";
      extraConfig = {
        core = {
          editor = "nvim";
          autocrlf = "input";
        };
        push = {
          autoSetupRemote = true;
        };
        pull = {
          rebase = true;
        };
        rebase = {
          autoStash = true;
        };
        advice = {
          statusHints = false;
        };
        credential = {
          helper = [
            "" # Empty string tells git to disregard any other config
            "${pkgs.git-credential-manager}/bin/git-credential-manager"
          ];
        };
      };
    };
    zsh = {
      autocd = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh"; # Must be relative to ~
      localVariables = {
        CONFIG_DIR = "/Users/${user}/${configHome}";
        PROJ_DIR = "$HOME/project";
        SYS_CONFIG_DIR = "/Users/${user}/${configHome}/system";
      };
      history = {
        expireDuplicatesFirst = true;
        ignoreDups = true;
        path = "/Users/${user}/${configHome}/zsh/zsh_history";
      };
      historySubstringSearch = {
        enable = true;
      };
      profileExtra = "export SHELL_SESSIONS_DISABLE=1";
      initExtra = builtins.readFile ./common/zshrc.zsh;
      shellAliases = import ./common/shellAlias.nix // { };
    };
  };
in
{ inputs, ... }: inputs.darwin.lib.darwinSystem {
  system = system;
  pkgs = import inputs.nixpkgs {
    system = system;
  };
  modules = [
    inputs.home-manager.darwinModules.home-manager
    ({ pkgs, ... }:
      {
        environment = {
          shells = [ pkgs.zsh ];
          etc.hushlogin.enable = true;
          etc."pam.d/sudo_local" = {
            text = ''
              auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so
              auth       sufficient     pam_tid.so
            '';
          };
        };
        fonts.packages = [ pkgs.nerd-fonts.fira-code ];
        nix.extraOptions = "experimental-features = nix-command flakes";
        homebrew = {
          enable = true;
          caskArgs.no_quarantine = true;
          global.brewfile = true;
          masApps = { };
          casks = casks;
          taps = [ ];
          brews = brews;
        };
        system = {
          stateVersion = 4;
        } // (settings pkgs);
        users.users.${user} = {
          name = "${user}";
          home = "/Users/${user}";
        };
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} =
          { pkgs, config, ... }:
          {
            home = {
              packages = (map (name: pkgs.${name}) packages);
              sessionPath = path;
              enableNixpkgsReleaseCheck = false;
              stateVersion = "24.05";
            };
            xdg.configFile = builtins.listToAttrs (map
              (key: {
                name = key;
                value = {
                  source = (config.lib.file.mkOutOfStoreSymlink "/Users/${user}/${configHome}/system/${key}");
                };
              })
              configLinks);
            programs = (builtins.mapAttrs (k: v: v // { enable = true; }) (programs pkgs)) // {
              home-manager.enable = true;
            };
          };
      })
  ];
}
