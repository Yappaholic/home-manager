{pkgs}: {
  enable = false;
  mouse = true;
  baseIndex = 1;
  prefix = "C-s";
  newSession = true;
  sensibleOnTop = true;
  escapeTime = 0;
  extraConfig = ''
    set-option -sa terminal-overrides ",xterm*:Tc"
  '';
  plugins = with pkgs; [
    tmuxPlugins.vim-tmux-navigator
    tmuxPlugins.tmux-which-key
    {
      plugin = tmuxPlugins.tilish;
      extraConfig = "set -g @tilish-navigator 'on'";
    }
    {
      plugin = tmuxPlugins.tmux-colors-solarized;
      extraConfig = "set -g @colors-solarized 'dark'";
    }
  ];
}
