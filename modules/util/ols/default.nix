let
  pkgs = import <nixos> {};
in {
  ols = pkgs.callPackage ./ols.nix {};
}
