{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    determinate,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {inherit inputs;};
      modules = [
        ./system/configuration.nix
        determinate.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.users.savvy = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    };
    homeConfigurations.savvy = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        {
          extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    };
    # Custom ISO
    nixosConfigurations.customIso = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./modules/iso/configuration.nix
      ];
    };
  };
}
