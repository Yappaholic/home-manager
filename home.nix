{
  pkgs,
  inputs,
  #kak-tree-sitter-helix,
  ...
}: {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";
  home.stateVersion = "24.05";
  imports = [
    ./modules/editors/helix.nix
    ./modules/util/other.nix
    ./modules/util/gtk.nix
    #./modules/shell/zsh.nix
  ];

  home.packages = with pkgs; [
    waybar
    kotatogram-desktop
    pnpm
    nodejs_23
    bun
    nodePackages.typescript-language-server
    tailwindcss-language-server
    nodePackages.vscode-langservers-extracted
    wlogout
    bemenu
    btop
    pkgs.nerd-fonts.jetbrains-mono
    elvish
    murex
    onefetch
    fastfetch
    bat
    nixd
    wpsoffice
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
    niri
    xwayland-satellite
    tealdeer
    #kakoune-unwrapped
    #kakoune-lsp
    #kak-popup
    tmux
    skim
    fd
    c3c
    c3-lsp
    jdt-language-server
    clang
    clang-tools
    zigpkgs.master
    vesktop
    maven
    rustup
    xdg-utils
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    inputs.zen-browser.packages."${system}".default
  ];

  programs.gh = {
    enable = true;
    settings = {
      editor = "hx";
      git_protocol = "ssh";
    };
  };

  programs.starship = {
    enable = true;
  };
  #programs.kak-tree-sitter-helix.enable = true;

  programs.java.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
