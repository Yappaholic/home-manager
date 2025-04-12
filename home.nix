{
  pkgs,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  ghostty-git = inputs.ghostty.packages.${system}.default;
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
  ];

  home.packages = with pkgs; [
    #ad
    obsidian
    #emacs29-pgtk
    emacs30-pgtk
    #emacs-lsp-booster
    waybar
    kotatogram-desktop
    nodejs_23
    bun
    odin-git
    ols-git
    wlogout
    go
    btop
    pkgs.nerd-fonts.jetbrains-mono
    onefetch
    fastfetch
    bat
    wpsoffice
    corefonts
    vistafonts
    viber
    wl-clipboard
    wl-clipboard-x11
    wlsunset
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
    clang-tools
    tailwindcss-language-server
    rustup
    xdg-utils
    nix-your-shell
    inputs.zen-browser.packages."${system}".default
    fnm
    wmenu
    ghostty-git
    hyprpaper
  ];

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
  services.wlsunset = {
    enable = true;
    latitude = 54;
    longitude = 27;
    temperature = {
      day = 6500;
      night = 3500;
    };
  };
  services.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
    socketActivation.enable = true;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = ["~/Pictures/wallpaper.png"];
      wallpaper = ["DVI-I-1,~/Pictures/wallpaper.png"];
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
        config = import ./modules/wm/sway/config.nix;
      };
    };
  };
  # programs.starship = {
  #   enable = true;
  # };

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
