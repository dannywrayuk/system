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

    outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
        darwinConfigurations = (import ./nix/host.nix).withDefault {
            default = "DannysMacbookAir";
            DannysMacbookAir = ({ user }: darwin.lib.darwinSystem {
                system = "aarch64-darwin";
                pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; };
                modules = [
                    ./nix/darwin.nix
                        home-manager.darwinModules.home-manager {
                            users.users.${user}= {
                                name = "${user}";
                                home = "/Users/${user}";
                            };
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.${user} = import ./nix/home-manager.nix;
                        }
                ];
            });

        };
    };
}

