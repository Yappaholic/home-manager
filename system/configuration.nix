# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  system = "x86_64-linux";
  zen-browser = inputs.zen-browser.packages."${system}".default;
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
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.binfmt.emulatedSystems = ["aarch64-linux"];
  boot.kernelPackages = pkgs.linuxPackages_cachyos-gcc;
  zramSwap.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.enableIPv6 = false;
  networking.nameservers = ["8.8.8.8" "8.8.8.4"];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  #networking.dhcpcd.enable = true;
  documentation.dev.enable = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    wlr.enable = lib.mkForce true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
  programs.xwayland = {
    enable = true;
    package = pkgs.xwayland-satellite;
  };
  programs.niri = {
    enable = true;
    package = pkgs.niri_git;
  };
  services.flatpak.enable = true;
  services.guix = {
    enable = true;
    substituters.urls = [
      "https://bordeaux.guix.gnu.org"
      "https://mirror.yandex.ru/mirrors/guix/"
    ];
  };
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-cachyos_x86_64_v3
      proton-ge-custom
    ];
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
  };
  console.useXkbConfig = true;
  services.xserver = {
    enable = true;
    exportConfiguration = false;
    displayManager.session = [
      {
        manage = "window";
        name = "leftwm";
        start = ''exec dbus-launch leftwm'';
      }
    ];
    xkb = {
      layout = "us,ru";
      variant = "colemak_dh_wide_iso";
      options = "grp:toggle,ctrl:nocaps";
    };
    videoDrivers = ["nvidia"];
    windowManager.qtile = {
      enable = true;
      package = inputs.qtile.packages.${system}.default;
      extraPackages = python3Packages:
        with python3Packages; [
          qtile-extras
        ];
    };
    windowManager.xmonad = {
      enable = false;
      enableContribAndExtras = true;
      config = null;
      enableConfiguredRecompile = true;
      haskellPackages = pkgs.haskell.packages.ghc984;
      ghcArgs = ["-O2" "-fllvm"];
    };
  };

  # services.postgresql = {
  #   enable = false;
  #   ensureDatabases = ["mydb"];
  #   enableTCPIP = true;
  #   settings = {
  #     ssl = true;
  #   };
  #   authentication = pkgs.lib.mkOverride 10 ''
  #     local all  all     						trust
  #     host  all  all  127.0.0.1/32  trust
  #     host  all  all  ::1/128 		  trust
  #   '';
  # };

  programs.dconf.enable = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [libvdpau-va-gl];
  };
  services.dbus = {
    implementation = "broker";
  };
  programs.hyprland.enable = true;
  programs.sway = {
    enable = false;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraOptions = ["--unsupported-gpu"];
    extraPackages = with pkgs; [
      i3status-rust
      autotiling-rs
      swayidle
    ];
  };

  services.displayManager.ly = {
    enable = true;
    settings = {
      path = "/run/current-system/sw/bin:/opt/bin";
    };
  };
  services.emacs = {
    enable = true;
    install = true;
    package = with pkgs; (
      (emacsPackagesFor emacs-pgtk).emacsWithPackages (
        epkgs: [epkgs.vterm]
      )
    );
  };
  programs.java.enable = true;

  #services.ollama = {
  #  enable = true;
  #  loadModels = ["deepseek-coder"];
  #  acceleration = "cuda";
  #};

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  programs.zsh = {
    enable = false;
    loginShellInit = ''export PATH=/opt/bin:$PATH'';
  };
  programs.fish.enable = true;
  programs.nh = {
    enable = true;
    flake = "/home/savvy/.config/nixos";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.savvy = {
    isNormalUser = true;
    description = "Nixyy";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      # Programming languages
      alejandra
      #bash-env-nushell
      nixd
      clang
      rustup
      clang-tools
      #godot-mono
      man-pages
      man-pages-posix

      # Editors and text
      emacs-lsp-booster
      kakoune-unwrapped
      kakoune-lsp

      # Window managers and desktop
      feh
      gammastep
      #rofi
      #picom-pijulius
      #polybarFull
      #polybar-pulseaudio-control
      ghostty
      #leftwm
      #leftwm-config
      #leftwm-theme
      #xmobar
      #xdotool
      #trayer
      waybar
      wlsunset
      wl-clipboard
      swww
      telegram-desktop
      wlogout
      #softmaker-office
      corefonts
      vistafonts
      viber
      xdg-utils
      zen-browser
      youtube-music
      wmenu

      # CLI tools
      nix-your-shell
      gitu
      pass-wayland
      bc
      mpv
      yt-dlp
      btop
      onefetch
      fastfetch
      bat
      xclip
      xsel
      dust
      tealdeer
      fzf
      fd
      tmux
      jq
      ripgrep
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    vim
    git
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
