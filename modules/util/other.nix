{...}: {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    # enableNushellIntegration = true;
  };
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
    #enableNushellIntegration = true;
  };
  # programs.oh-my-posh = {
  #   enable = true;
  #   #enableNushellIntegration = true;
  #   enableZshIntegration = true;
  #   useTheme = "pure";
  # };
}
