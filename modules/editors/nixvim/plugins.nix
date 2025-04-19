{pkgs, ...}: let
  lsp = import ./lsp.nix {pkgs = pkgs;};
  conform-nvim = import ./conform.nix;
in {
  inherit lsp;
  lsp-format.enable = true;
  telescope.enable = true;
  oil = {
    enable = true;
    settings = {
      keymaps = {
        "CR" = "actions.select";
        "<C-c>" = "actions.close";
        "<C-l>" = "actions.refresh";
        "q" = "actions.close";
        "#" = "actons.cd";
        "g." = "actions.toggle_hidden";
      };
      view_options = {
        show_hidden = true;
      };
    };
  };
  godot.enable = true;
  neogit.enable = true;
  project-nvim = {
    enable = true;
    enableTelescope = true;
    settings = {
      detection_methods = ["lsp" "pattern"];
      patterns = [".git" "package.json" ".editorconfig" "Cargo.toml"];
    };
  };
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
          ['<C-y>'] = cmp.mapping.confirm({select = true}),
          ['<C-c>'] = cmp.mapping.abort(),
        })
      '';
    };
  };
  cmp-nvim-lsp.enable = true;
  cmp-path.enable = true;
  cmp-buffer.enable = true;
  dashboard.enable = true;
  nvim-autopairs.enable = true;
  harpoon.enable = true;
  lualine.enable = true;
  nvim-surround.enable = true;
  todo-comments.enable = true;
  trouble.enable = true;
}
