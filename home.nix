{
  pkgs,
  #kak-tree-sitter-helix,
  ...
}: {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";

  home.stateVersion = "24.05";
  #imports = [kak-tree-sitter-helix];

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
        "hms" = "home-manager switch";
        "hmv" = "hx ~/.config/home-manager";
        "nixv" = "sudoedit /etc/nixos/configuration.nix";
      };
    };
    sessionVariables = {
      EDITOR = "hx";
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
