{
    description = "System Configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        darwin.url = "github:lnl7/nix-darwin";
        darwin.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
        darwinConfigurations = import ./host.nix ({ user, host, ... }:
            darwin.lib.darwinSystem {
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
}

