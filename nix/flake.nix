{
  description = "System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
      sys-vars = import ./util/system-variables.nix;
    in
    {
      darwinConfigurations = (
        import ./util/withDefault.nix
          "DannysMacbookAir"
          sys-vars
      ) {
        DannysMacbookAir = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; };
          modules = with sys-vars; [
            ./module/darwin.nix
            home-manager.darwinModules.home-manager
            {
              users.users.${user} = {
                name = "${user}";
                home = "/Users/${user}";
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./module/home-manager.nix;
            }
          ];
        };
        # );

      };
    };
}

