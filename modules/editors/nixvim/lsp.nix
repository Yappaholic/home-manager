{pkgs, ...}: {
  enable = true;
  inlayHints = true;
  servers = {
    html.enable = true;
    htmx.enable = true;
    nushell.enable = true;
    ts_ls.enable = true;
    marksman.enable = true;
    gopls.enable = true;
    jsonls.enable = true;
    yamlls.enable = true;
    nixd.enable = true;
    lua_ls.enable = true;
    eslint.enable = true;
    cssls.enable = true;
    tailwindcss.enable = true;
    cmake.enable = true;
    clangd.enable = true;
    intelephense = {
      enable = true;
      package = pkgs.intelephense;
    };
    volar = {
      enable = true;
    };
    rust_analyzer = {
      enable = true;
      installRustc = false;
      installCargo = false;
    };
  };
}
