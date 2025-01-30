{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
  };

  outputs = {
    self,
    zen-browser,
    zig,
    zls,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        ./home.nix
        ./modules/util/other.nix
        ./modules/editors/helix.nix
        {nixpkgs.overlays = [zig.overlays.default];}
        inputs.home-manager.nixosModules.default
        {
          home-packages = [
            zen-browser.packages."${system}".default
            zls.packages."${system}".default
          ];
        }
      ];
    };
  };
}
