{
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
}
