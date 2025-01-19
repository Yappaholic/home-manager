{
  description = "Home Manager configuration of savvy";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixvim.url = "github:nix-community/nixvim";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
    kak-tree-sitter-helix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:igor-ramazanov/kak-tree-sitter-helix";
    };
    kak-popup = {
      url = "github:enricozb/popup.kak";
    };
    #nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    nixpkgs,
    home-manager,
    zen-browser,
    kak-tree-sitter-helix,
    nixvim,
    zig,
    zls,
    kak-popup,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."savvy" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
        nixvim.homeManagerModules.nixvim
        ./modules/shell/nushell.nix
        ./modules/util/other.nix
        ./modules/editors/helix.nix
        #./modules/editors/nvf/nvf.nix
        ./modules/editors/nixvim/nixvim.nix
        {nixpkgs.overlays = [kak-popup.overlays.default zig.overlays.default];}
        {
          home.packages = [
            zen-browser.packages."${system}".default
            zls.packages."${system}".default
          ];
        }
      ];
      extraSpecialArgs = {
        inherit (kak-tree-sitter-helix.homeManagerModules.x86_64-linux) kak-tree-sitter-helix;
      };
    };
  };
}
