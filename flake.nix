{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin }:
    let username = "npetitcoulaud";
    in {
      nixosConfigurations = let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        pc-de-nicolas = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system pkgs; };
          modules = [
            catppuccin.nixosModules.catppuccin
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit pkgs username; };
              home-manager.users.${username} = {
                imports = [
                  ./hosts/desktop/home.nix
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
            }
          ];
        };
      };
    };

}
