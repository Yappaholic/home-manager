{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    wezterm.url = "github:wezterm/wezterm?dir=nix";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    bash-env-nushell.url = "github:tesujimath/bash-env-nushell";
    nixvim.url = "github:nix-community/nixvim";
    kak-tree-sitter-helix.url = "github:igor-ramazanov/kak-tree-sitter-helix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    kak-tree-sitter-helix,
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
          home-manager.useUserPackages = true;
          home-manager.users.savvy = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            inherit (kak-tree-sitter-helix.homeManagerModules."${system}") kak-tree-sitter-helix;
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
    #Custom ISO
    nixosConfigurations.customIso = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./modules/iso/configuration.nix
      ];
    };
  };
}
