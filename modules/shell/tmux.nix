{pkgs}: {
  enable = true;
  mouse = true;
  terminal = "screen-256color";
  prefix = "C-s";
  newSession = true;
  sensibleOnTop = true;
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
