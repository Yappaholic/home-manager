{pkgs, ...}: {
  programs.fish = {
    enable = true;
    package = pkgs.callPackage ./fish-package.nix {};
  };
}
