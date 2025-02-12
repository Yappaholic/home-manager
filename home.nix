{
  pkgs,
  inputs,
  kak-tree-sitter-helix,
  ...
}: let
  system = "x86_64-linux";
  fish-git = pkgs.callPackage ./modules/shell/fish/fish-package.nix {};
  zls-git = inputs.zls.packages.${system}.default;
  umu-launcher = inputs.umu.packages.${system}.default;
in {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";
  home.stateVersion = "24.05";
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    kak-tree-sitter-helix
    ./modules/editors/nixvim/nixvim.nix
    ./modules/editors/helix.nix
    ./modules/util/other.nix
    ./modules/util/gtk.nix
  ];

  home.packages = with pkgs; [
    obsidian
    emacs29-pgtk
    emacs-lsp-booster
    waybar
    lutris
    umu-launcher
    zed-editor
    kotatogram-desktop
    pnpm
    nodejs_23
    bun
    wlogout
    go
    bemenu
    btop
    pkgs.nerd-fonts.jetbrains-mono
    wineWowPackages.waylandFull
    murex
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
    slurp
    grim
    swww
    alejandra
    dust
    prettierd
    xwayland-satellite
    tealdeer
    jdt-language-server
    kakoune-unwrapped
    kakoune-lsp
    kak-popup
    tmux
    skim
    fd
    c3c
    c3-lsp
    clang
    nixd
    intelephense
    nodePackages.vscode-langservers-extracted
    typescript-language-server
    gopls
    clang-tools
    tailwindcss-language-server
    zigpkgs.master
    zls-git
    php
    php.packages.composer
    vesktop
    maven
    rustup
    xdg-utils
    nix-your-shell
    inputs.zen-browser.packages."${system}".default
    fish-git
  ];

  programs.gh = {
    enable = true;
    settings = {
      editor = "kak";
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

  programs.starship = {
    enable = true;
  };
  programs.kak-tree-sitter-helix.enable = true;

  programs.java.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
