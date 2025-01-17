{
  enable = true;
  inlayHints = true;
  servers = {
    html.enable = true;
    htmx.enable = true;
    nushell.enable = true;
    ts_ls.enable = true;
    denols = {
      enable = true;
      autostart = true;
      filetypes = [".ts" ".js" ".tsx" ".jsx" ".cjs" ".mjs" ".mts" ".cts"];
    };
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
  };
}
