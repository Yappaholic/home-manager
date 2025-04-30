{pkgs, ...}: let
  terminal = "wezterm";
  browser = "qutebrowser";
  eclient = "emacsclient -c";
  nvim = "${terminal} -e nvim";
in {
  enable = true;
  extraConfig = ''
    tag_names=( {1..9} )
    tag_keys=( {1..9} 0 )

    herbstclient rename default "''${tag_names[0]}" || true

    for i in ''${!tag_names[@]} ; do
     herbstclient add "''${tag_names[$i]}"
     key="''${tag_keys[$i]}"
     if ! [ -z "$key" ] ; then
       herbstclient keybind "Mod4-$key" use_index "$i"
       herbstclient keybind "Mod4-Shift-$key" move_index "$i"
     fi
    done

    herbstclient keybind Mod4-space \
         or , and . compare tags.focus.curframe_wcount = 2                   \
                  . cycle_layout +1 vertical horizontal max vertical grid    \
            , cycle_layout +1

    herbstclient spawn $HOME/.config/herbstluftwm/apps_start
  '';
  package = pkgs.herbstluftwm.overrideAttrs (_: o: {disabledTests = o.disabledTests ++ ["test_new_attr_is_writable"];});
  keybinds = {
    Mod4-Shift-q = "quit";
    Mod4-Shift-c = "reload";
    Mod4-c = "close";
    Mod4-r = "remove";
    Mod4-Return = "spawn ${terminal}";
    Mod4-z = "spawn ${browser}";
    Mod4-e = "spawn ${eclient}";
    Mod4-n = "spawn ${nvim}";
    Mod4-p = "spawn rofi -show drun";
    Mod4-u = "split bottom 0.5";
    Mod4-o = "split right 0.5";
    Mod4-Tab = "cycle";
    Mod4-Control-space = "split explode";

    Mod4-h = "focus left";
    Mod4-j = "focus down";
    Mod4-k = "focus up";
    Mod4-l = "focus right";

    Mod4-Control-h = "resize left +0.02";
    Mod4-Control-j = "resize down +0.02";
    Mod4-Control-k = "resize up +0.02";
    Mod4-Control-l = "resize right +0.02";

    Mod4-Shift-h = "shift left";
    Mod4-Shift-j = "shift down";
    Mod4-Shift-k = "shift up";
    Mod4-Shift-l = "shift right";

    Mod4-s = "floating toggle";
    Mod4-f = "fullscreen toggle";
  };
  mousebinds = {
    Mod4-B1 = "move";
    Mod4-B3 = "resize";
  };
  rules = [
    "focus=on"
    "floatplacement=center"
  ];
  settings = {
    focus_follows_mouse = true;
    frame_border_width = 2;
    frame_normal_opacity = 0;
    frame_border_active_color = "#F0C674";
    frame_border_normal_color = "#8ABEB7";
    gapless_grid = false;
    frame_gap = 5;
    window_gap = 5;
    smart_frame_surroundings = "hide_all";
    smart_window_surroundings = "on";
    default_frame_layout = "horizontal";
  };
}
