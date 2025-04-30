if status is-interactive
    # Commands to run in interactive sessions can go here
end

if command -q nix-your-shell
    nix-your-shell fish | source
end

set --export __GLX_VENDOR_LIBRARY_NAME nvidia
set --export LIBVA_DRIVER_NAME nvidia
set --export NVD_BACKEND direct
set --export EDITOR kak
set --export LSP_USE_PLISTS true

fish_add_path ~/.cargo/bin
fish_add_path ~/.bun/bin
fish_add_path ~/go/bin

abbr --add ff fastfetch
abbr --add of onefetch
abbr --add ls eza
abbr --add la eza -la
abbr --add hmv $EDITOR ~/.config/nixos/home.nix
abbr --add hms nh os switch ~/.config/nixos
abbr --add ga git add
abbr --add gc git commit
abbr --add gs git status
abbr --add k kak
abbr --add z zeditor
alias v=nvim

if test $TERM != "linux" && test -z "$ZELLIJ" 
  zellij
end

