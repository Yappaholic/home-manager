use river_rs::config::Config;
use river_rs::config::KeyboardLayout;
use river_rs::layout::Layout;

fn main() {
    let mut config: Config = Config::default();
    let autostart: Vec<&str> = vec![
        "pipewire",
        "waybar -c ~/.config/waybar/config",
        "swww-daemon",
        "swww img ~/Pictures/wallpaper.jpg",
        "gammastep -t 6500:3000 -l 56:27",
        "emacs --daemon",
    ];
    let layout: KeyboardLayout<&str> = KeyboardLayout {
        rules: None,
        model: None,
        variant: Some("colemak_dh_wide_iso,"),
        options: Some("grp:toggle,ctrl:nocaps"),
        layout: Some("us,ru"),
    };

    let mut river_layout: Layout = Layout::default();
    let layout_args = "\
    --layout                       left        \
    --layout-alt                   monocle     \
    --stack                        dwindle     \
    --count-master                 1           \
    --ratio-master                 0.50        \
    --count-wide-left              0           \
    --ratio-wide                   0.35        \
    --smart-gaps                               \
    --inner-gaps                   2           \
    --outer-gaps                   2           \
    --border-width                 2           \
    --border-width-monocle         0           \
    --border-width-smart-gaps      0           \
    --log-threshold                info        ";

    river_layout.set_generator("wideriver");
    river_layout.set_args(layout_args);

    let layout_keybinds = vec![["M", "--layout monocle"], ["D", "--layout left"]];
    let keybinds = vec![
        ["Q", "spawn ghostty"],
        ["C", "close"],
        ["J", "focus-view next"],
        ["K", "focus-view previous"],
        ["W", "spawn wlogout"],
        ["E", "spawn /opt/bin/eclient"],
        ["P", "spawn /opt/bin/fuzzel-launcher"],
        ["B", "spawn zen-bin"],
    ];
    let shift_keybinds = vec![["E", "exit"], ["J", "swap next"], ["K", "swap previous"]];
    config
        .set_keybinds(keybinds)
        .set_mouse_keybinds(Some("move-view"), Some("resize-view"), None)
        .change_super("Super+Shift")
        .set_keybinds(shift_keybinds)
        .set_tags("Super", "Super+Shift")
        .set_repeat(30, 300)
        .set_keyboard_layout(layout)
        .set_layout_generator(river_layout)
        .set_layout_keybinds(layout_keybinds)
        .autostart(autostart)
        .apply()
        .unwrap();
}
