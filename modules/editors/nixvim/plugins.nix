{pkgs, ...}: let
  lsp = import ./lsp.nix {pkgs = pkgs;};
  conform-nvim = import ./conform.nix;
in {
  lsp-format.enable = true;
  telescope.enable = true;
  oil.enable = true;
  treesitter = {
    enable = true;
    luaConfig.post = ''
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            -- change the following as needed
            parser_config.blade = {
              install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = {"src/parser.c"},
                branch = "main",
              },
              filetype = "blade",
            }
    '';
  };
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
  snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      zen.enabled = true;
    };
  };
  nvim-autopairs.enable = true;
  harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<leader>h";
      navFile = {
        "1" = "<M-1>";
        "2" = "<M-2>";
        "3" = "<M-3>";
        "4" = "<M-4>";
      };
    };
  };
  lualine.enable = true;
  nvim-surround.enable = true;
  noice = {
    enable = true;
  };
  todo-comments.enable = true;
  trouble.enable = true;
  tailwind-tools.enable = true;
}
