{lib}: let
  menu = "wmenu";
  browser = "zen";
  screenshot = "grim -g \"$(slurp)\" | wl-copy";
  mod = "Mod4";
  terminal = "ghostty";
in {
  modifier = "Mod4";
  terminal = "ghostty";
  input = {
    "*" = {
      xkb_variant = "colemak_dh_iso_wide,";
      xkb_options = "grp:toggle,ctrl:nocaps";
      xkb_layout = "us,ru";
      repeat_rate = 30;
      repeat_delay = 200;
    };
  };
  output = {
    DVI-I-1 = {
      bg = "~/Pictures/wallpaper.png";
      resolution = "1920x1080";
      scale = "1.0";
      adaptive_sync = "on";
    };
  };
  up = "k";
  down = "j";
  left = "h";
  right = "l";

  keybinds = lib.mkOptionDefault {
    #Apps
    "${mod}+q" = "exec ${terminal}";
    "${mod}+p" = "exec ${menu}";
    "${mod}+b" = "exec ${browser}";
    "${mod}+t" = "exec ${screenshot}";
    "${mod}+e" = "exec emacs";
    # System
    "${mod}+c" = "kill";
    "${mod}+Shift+c" = "reload";
    "${mod}+Shift+s" = "move scratchpad";
    "${mod}+s" = "scratchpad show";
  };

  bars = {
    "*" = {
      fonts = {
        names = ["Hasklug Nerd Font Mono"];
        size = 11.0;
      };
      mode = "dock";
      statusCommand = "i3status-rs";
    };
  };
  startup = [
    {command = "gammastep -l 56:27 -t 6500:3000";}
    {
      command = "autotiling-rs";
      always = true;
    }
  ];
}
