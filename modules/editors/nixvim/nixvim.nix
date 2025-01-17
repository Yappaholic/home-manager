{pkgs, ...}: let
  keymaps = import ./keymaps.nix;
  opts = import ./opts.nix;
  plugins = import ./plugins.nix;
in {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    extraFiles = {
      "lsp/deno.lua".text = ''
        vim.g.markdown_fenced_languages = {
        	"ts=typescript"
        }
      '';
    };
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
    clipboard.providers.wl-copy = {
      enable = true;
      package = pkgs.wl-clipboard-rs;
    };
    colorschemes.oxocarbon = {
      enable = true;
    };
    inherit opts;
    inherit plugins;
    inherit keymaps;
  };
}
