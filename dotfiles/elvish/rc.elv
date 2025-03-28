fn ls {|@a| eza $@a }
fn ff { fastfetch }
fn of { onefetch }
fn em {|@a| emacs $@a }
fn k {|@a| kak $@a }
set-env EDITOR kak
use path
set paths = (conj $paths ~/.local/bin ~/.cargo/bin ~/bin ~/.local/bin/ ~/go/bin /opt/bin ~/.bun/bin)
