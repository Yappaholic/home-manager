{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    umu.url = "github:Open-Wine-Components/umu-launcher?dir=packaging/nix";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
    nixvim.url = "github:nix-community/nixvim";
    kak-tree-sitter-helix.url = "github:igor-ramazanov/kak-tree-sitter-helix";
    kak-popup.url = "github:enricozb/popup.kak";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    zig,
    kak-popup,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {inherit inputs;};
      modules = [
        ./system/configuration.nix
        {nixpkgs.overlays = [zig.overlays.default kak-popup.overlays.default];}
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.users.savvy = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            inherit (inputs.kak-tree-sitter-helix.homeManagerModules.${system}) kak-tree-sitter-helix;
          };
        }
      ];
    };
  };
}
