{...}: {
  programs.nushell = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      kk = "kak";
      hms = "nh home switch /home/savvy/.config/home-manager";
      hmv = "run-external $env.EDITOR /home/savvy/.config/home-manager/home.nix";
      ff = "fastfetch";
      of = "onefetch";
    };
    environmentVariables = {
      EDITOR = "hx";
      SKIM_DEFAULT_COMMAND = "fd --type f -E node_modules -E bundle";
    };
    extraConfig = ''
    	$env.PATH ++= ":~/.cargo/bin"
    '';
  };
}
