{
  pkgs,
  kak-tree-sitter-helix,
  ...
}: {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";

  home.stateVersion = "24.05";
  imports = [kak-tree-sitter-helix];

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
    fish
    onefetch
    fastfetch
    rustup
    bat
    nixd
    wpsoffice
    viber
    wl-clipboard-rs
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
    kakoune-unwrapped
    kakoune-lsp
    kak-popup
    tmux
    skim
    fd
    c3c
    c3-lsp
    clang
    clang-tools
    zigpkgs.master
    vesktop
  ];

  programs.gh = {
    enable = true;
    settings = {
      editor = "nvim";
      git_protocol = "ssh";
    };
  };
  programs.kak-tree-sitter-helix.enable = true;

  nixpkgs.config.allowUnfree = true;

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 12;
    };
    theme = {
      name = "Kanagawa-B";
      package = pkgs.kanagawa-gtk-theme;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 12;
  };

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
