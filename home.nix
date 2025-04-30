{
  pkgs,
  lib,
  inputs,
  kak-tree-sitter-helix,
  ...
}: {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";
  home.stateVersion = "24.05";
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    kak-tree-sitter-helix
    ./modules/util/other.nix
    ./modules/util/gtk.nix
    #./modules/editors/helix.nix
    ./modules/editors/nixvim/nixvim.nix
    #./modules/shell/nushell.nix
    #./modules/shell/zsh.nix
  ];

  programs.kak-tree-sitter-helix.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.monaspace
  ];

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
  services.hyprpaper = {
    enable = false;
    settings = {
      ipc = "on";
      splash = false;
      preload = ["~/Pictures/wallpaper.jpg"];
      wallpaper = ["DVI-I-1,~/Pictures/wallpaper.jpg"];
    };
  };
  xsession = {
    windowManager = {
      herbstluftwm = import ./modules/wm/herbsluftwm/config.nix {pkgs = pkgs;};
    };
  };
  wayland = {
    windowManager = {
      hyprland = {
        enable = false;
        settings = import ./modules/wm/hyprland/config.nix;
        systemd.enable = true;
      };
      sway = {
        enable = false;
        package = null;
        config = import ./modules/wm/sway/config.nix {lib = lib;};
        extraConfig = ''
          blur enable
          blur_xray disable
          blur_passes 3
          blur_radius 3
          default_dim_inactive 0.1
        '';
      };
    };
  };

  programs.tmux = import ./modules/shell/tmux.nix {pkgs = pkgs;};

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
