{
  inputs,
  pkgs,
  ...
}: let
  bash-env-nushell = inputs.bash-env-nushell.packages."x86_64-linux".default;
in {
  programs.nushell = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      k = "kak";
      hms = "nh os switch ~/.config/nixos";
      hmv = "run-external $env.EDITOR /home/savvy/.config/home-manager/home.nix";
      ff = "fastfetch";
      of = "onefetch";
    };
    environmentVariables = {
      EDITOR = "hx";
      SKIM_DEFAULT_COMMAND = "fd --type f -E node_modules -E bundle";
    };
    extraConfig = ''
      use ${bash-env-nushell}/bash-env.nu
      source ~/.config/nushell/login.nu
      $env.PATH = $env.PATH | append "/opt/bin" | append "~/go/bin" | append "~/.cargo/bin"
      mkdir ($nu.data-dir | path join "vendor/autoload")
      ${pkgs.starship}/bin/starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    '';
    extraLogin = ''
      $env.WLR_RENDERER = "vulkan"
      $env.__GLX_VENDOR_LIBRARY_NAME = "nvidia"
      $env.LIBVA_DRIVER_NAME = "nvidia"
      $env.NVD_BACKEND = "direct"
      $env.QT_QPA_PLATFORM = "wayland"
      $env.LSP_USE_PLISTS = "true"
    '';
  };
}
