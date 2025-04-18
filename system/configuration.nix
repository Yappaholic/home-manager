# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.enableIPv6 = false;
  networking.nameservers = ["8.8.8.8" "8.8.8.4"];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  #networking.networkmanager.enable = true;
  networking.dhcpcd.enable = true;
  #nix.settings.substituters = ["https://aseipp-nix-cache.global.ssl.fastly.net"];

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  xdg.portal = {
    enable = true;
    wlr.enable = lib.mkForce true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
  #programs.xwayland = {
  #  enable = true;
  #  package = pkgs.xwayland-satellite;
  #};
  #programs.niri = {
  #  enable = true;
  #};
  programs.river = {
    enable = true;
  };

  services.flatpak.enable = true;
  #programs.steam = {
  #  enable = true;
  #  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #  localNetworkGameTransfers.openFirewall = true;
  #};
  console.useXkbConfig = true;
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "colemak_dh_wide_iso";
      options = "grp:toggle,ctrl:nocaps";
    };
    videoDrivers = ["nvidia"];

    windowManager.herbstluftwm = {
      enable = false;
      configFile = null;
    };
    # windowManager.xmonad = {
    #   enable = true;
    #   enableContribAndExtras = true;
    #   enableConfiguredRecompile = true;
    #   config = builtins.readFile ../modules/wm/xmonad/xmonad.hs;
    # };
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
  # programs.hyprland.enable = true;
  services.dbus = {
    implementation = "broker";
  };
  programs.hyprland.enable = true;
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraOptions = ["--unsupported-gpu"];
    extraPackages = with pkgs; [
      i3status-rust
      autotiling-rs
      swayidle
    ];
  };
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      sway = {
        prettyName = "Sway-UWSM";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };
  };

  services.displayManager.ly = {
    enable = true;
  };
  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs-pgtk;
  };

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
  programs.nh = {
    enable = true;
    flake = "/home/savvy/.config/nixos";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.savvy = {
    isNormalUser = true;
    description = "Nixyy";
    shell = pkgs.nushell;
    extraGroups = ["networkmanager" "wheel"];
    packages = [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    git
    home-manager
    ion
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
