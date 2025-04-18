let
  terminal = "kitty";
  browser = "/opt/bin/nyxt-electron";
  eclient = "emacsclient -c";
in
{
    enable = true;
    keybinds = {
      Mod4-Shift-q = "quit";
      Mod4-Shift-c = "reload";
      Mod4-c = "close";
      Mod4-q = "spawn ${terminal}";
      Mod4-b = "spawn ${browser}";
      Mod4-e = "spawn ${eclient}";

      Mod4-h = "focus-left";
      Mod4-j = "focus-down";
      Mod4-k = "focus-up";
      Mod4-l = "focus-right";

      Mod4-Shift-h = "shift left";
      Mod4-Shift-j = "shift down";
      Mod4-Shift-k = "shift up";
      Mod4-Shift-l = "shift right";

      Mod4-1 = "use_index 1";
      Mod4-2 = "use_index 2";
      Mod4-3 = "use_index 3";
      Mod4-4 = "use_index 4";

      Mod4-Shift-1 = "move_index 1";
      Mod4-Shift-2 = "move_index 2";
      Mod4-Shift-3 = "move_index 3";
      Mod4-Shift-4 = "move_index 4";

      Mod4-Space = "floating toggle";
      Mod4-f = "fullscreen toggle";
    };
    mousebinds = {
      Mod4-B1 = "move";
      Mod4-B3 = "resize";
    };
    rules = [
      "focus=on"
      "floatplacement=smart"
    ];
    settings = {
      focus_follows_mouse = true;
      frame_border_width = 2;
      frame_gap = 5;
      smart_window_surroundings = "on";
    };
}
