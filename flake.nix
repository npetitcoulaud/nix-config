{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    npepkgs = {
      url = "github:npetitcoulaud/npepkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, catppuccin, nixvim, nix-darwin, npepkgs }:
    let username = "npetitcoulaud";
    in {
      nixosConfigurations = let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system pkgs; };
          modules = [
            catppuccin.nixosModules.catppuccin
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit system pkgs npepkgs username;
              };
              home-manager.users.${username} = {
                imports = [
                  ./hosts/desktop/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system pkgs; };
          modules = [
            catppuccin.nixosModules.catppuccin
            ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit system pkgs npepkgs username;
              };
              home-manager.users.${username} = {
                imports = [
                  ./hosts/laptop/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
      };
      darwinConfigurations = let
        system = "x86_64-darwin";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        macbook = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit self system pkgs; };
          modules = [
            ./hosts/macbook/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit pkgs username; };
              home-manager.users.${username} = {
                imports = [
                  ./hosts/macbook/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
      };
    };
}
