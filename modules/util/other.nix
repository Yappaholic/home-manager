{...}: {
  programs.eza = {
    enable = true;
    # enableNushellIntegration = true;
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.oh-my-posh = {
    enable = true;
    enableNushellIntegration = true;
    useTheme = "pure";
  };
}
