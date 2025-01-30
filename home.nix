{
  pkgs,
  #kak-tree-sitter-helix,
  ...
}: {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";
  home.stateVersion = "24.05";
  imports = [
    ./modules/editors/helix.nix
    ./modules/util/other.nix
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
  ];

  programs.gh = {
    enable = true;
    settings = {
      editor = "hx";
      git_protocol = "ssh";
    };
  };
  #programs.kak-tree-sitter-helix.enable = true;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    zsh-abbr = {
      enable = true;
      abbreviations = {
        "hms" = "sudo nixos-rebuild switch --flake ~/.config/nixos#default";
        "hmv" = "hx ~/.config/nixos";
      };
    };
    sessionVariables = {
      EDITOR = "hx";
      QT_QPA_PLATFORM = "wayland";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };
  };

  programs.java.enable = true;

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
