{
  lib,
  pkgs,
  ...
}: let
  keymaps = import ./keymaps.nix;
  opts = import ./opts.nix;
  plugins = import ./plugins.nix {
    lib = lib;
    pkgs = pkgs;
  };
in {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
    clipboard.providers.wl-copy = {
      enable = true;
      package = pkgs.wl-clipboard;
    };
    colorschemes.kanagawa = {
      enable = true;
      settings.theme = "dragon";
      compile = true;
    };
    inherit opts;
    inherit plugins;
    inherit keymaps;
  };
}
