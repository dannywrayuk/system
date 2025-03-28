{
  description = "System Configuration";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
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
    {
      darwinConfigurations = {
        DannysMacbookAir = (import ./personal.nix) { inherit inputs; };
        Dannys-Macbook-Pro = (import ./work.nix) { inherit inputs; };
      };
    };
}

