let
  lsp = import ./lsp.nix;
  conform-nvim = import ./conform.nix;
in {
  lsp-format.enable = true;
  telescope.enable = true;
  oil.enable = true;
  treesitter.enable = true;
  luasnip.enable = true;
  web-devicons.enable = true;
  inherit conform-nvim;
  cmp = {
    enable = true;
    autoEnableSources = true;
    settings.sources = [
      {name = "nvim_lsp";}
      {name = "path";}
      {name = "buffer";}
    ];
    settings.mapping = {
      __raw = ''
        cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        })
      '';
    };
  };
  cmp-nvim-lsp.enable = true;
  cmp-path.enable = true;
  cmp-buffer.enable = true;
  inherit lsp;
  dashboard.enable = true;
  dressing = {
    enable = true;
    autoLoad = true;
  };
  nvim-autopairs.enable = true;
  harpoon.enable = true;
  lualine.enable = true;
  nvim-surround.enable = true;
  noice = {
    enable = true;
  };
  todo-comments.enable = true;
  trouble.enable = true;
  tailwind-tools.enable = true;
}
