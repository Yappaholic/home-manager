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
    clipboard.providers.xclip = {
      enable = true;
      package = pkgs.xclip;
    };
    colorschemes.rose-pine = {
      enable = true;
      settings.variant = "main";
    };
    inherit opts;
    inherit plugins;
    inherit keymaps;
  };
}
