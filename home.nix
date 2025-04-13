{
  pkgs,
  lib,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  ols-git =
    pkgs.ols.overrideAttrs
    (final: prev: {
      src = pkgs.fetchFromGitHub {
        owner = "DanielGavin";
        repo = "ols";
        rev = "nightly";
        sha256 = "sha256-aUQKbZOrxDdUGORY2Rr2Drfxi0Q+dZZQSBCkJ+XQhcE=";
      };
      buildInputs = [odin-git];
    });
  odin-git =
    pkgs.odin.overrideAttrs
    (final: prev: {
      version = "dev-2025-03";
      src = pkgs.fetchFromGitHub {
        owner = "odin-lang";
        repo = "Odin";
        rev = "dev-2025-03";
        sha256 = "sha256-QmbKbhZglucVpsdlyxJsH2bslhqmd0nuMPC+E0dTpiY=";
      };
    });
in {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";
  home.stateVersion = "24.05";
  imports = [
    ./modules/util/other.nix
    ./modules/util/gtk.nix
    #./modules/shell/zsh.nix
  ];

  home.packages = with pkgs; [
    #ad
    obsidian
    emacs-pgtk
    #emacs-lsp-booster
    wideriver
    kitty
    waybar
    i3bar-river
    i3status-rust
    telegram-desktop
    nodejs_23
    bun
    R
    rPackages.languageserver
    odin-git
    ols-git
    wlogout
    go
    btop
    onefetch
    fastfetch
    bat
    wpsoffice
    corefonts
    vistafonts
    viber
    wl-clipboard
    wl-clipboard-x11
    gammastep
    hyprshot
    alejandra
    dust
    prettierd
    #xwayland-satellite
    tealdeer
    fzf
    fd
    nixd
    nodePackages.vscode-langservers-extracted
    typescript-language-server
    biome
    gopls
    cmake
    gnumake
    libvterm
    clang
    clang-tools
    tailwindcss-language-server
    rustup
    ripgrep
    nerd-fonts.jetbrains-mono
    xdg-utils
    nix-your-shell
    inputs.zen-browser.packages."${system}".default
    fnm
    wmenu
    starship
    hyprpaper
  ];

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = ["~/Pictures/wallpaper.jpg"];
      wallpaper = ["DVI-I-1,~/Pictures/wallpaper.jpg"];
    };
  };
  # xsession.windowManager = {
  #   awesome.enable = true;
  # };
 wayland = {
  windowManager = {
     hyprland.enable = false;
     sway = {
       enable = true;
       package = null;
       config = import ./modules/wm/sway/config.nix {lib = lib;};
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
