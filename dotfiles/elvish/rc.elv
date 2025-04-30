fn ls {|@a| eza $@a }
fn ff { fastfetch }
fn of { onefetch }
fn em {|@a| emacs $@a }
fn k {|@a| kak $@a }
fn v {|@a| nvim $@a }
fn hmv { $E:EDITOR ~/.config/nixos }
fn hms {|@a| nh os switch ~/.config/nixos -- $@a }
fn qtile { dbus-run-session (which qtile) start -b wayland }
fn sway { (which sway) --unsupported-gpu }
fn lsr { leftwm command SoftReload }

set-env EDITOR "nvim"
set-env WLR_RENDERER vulkan
set-env __GLX_VENDOR_LIBRARY_NAME nvidia
set-env LIBVA_DRIVER_NAME nvidia
set-env NVD_BACKEND direct
set-env QT_QPA_PLATFORM wayland
set-env LSP_USE_PLISTS true

use path
set paths = (conj $paths ~/.local/bin ~/.cargo/bin ~/bin ~/.local/bin/ ~/go/bin /opt/bin ~/.bun/bin)
