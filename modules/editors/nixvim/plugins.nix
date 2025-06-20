{pkgs, ...}: let
  lsp = import ./lsp.nix {pkgs = pkgs;};
  conform-nvim = import ./conform.nix;
in {
  inherit lsp;
  orgmode.enable = true;
  neorg = {
    enable = true;
    settings = {
      load = {
        "core.completion" = {
          config = {
            engine = "nvim-cmp";
          };
        };
        "core.concealer" = {
          config = {
            icon_preset = "varied";
          };
        };
        "core.defaults" = {
          __empty = null;
        };
      };
    };
    telescopeIntegration.enable = true;
  };
  lsp-format.enable = true;
  telescope.enable = true;
  which-key.enable = true;
  tmux-navigator = {
    enable = true;
    settings.no_mappings = 0;
    keymaps = [
      {
        action = "left";
        key = "<M-h>";
      }
      {
        action = "right";
        key = "<M-l>";
      }
      {
        action = "up";
        key = "<M-k>";
      }
      {
        action = "down";
        key = "<M-j>";
      }
    ];
  };
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
    settings = {
      ensureInstalled = "all";
      highlight = {
        enable = true;
      };
      indent.enable = true;
    };
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
  harpoon = {
    enable = true;
    enableTelescope = true;
  };
  lualine.enable = true;
  nvim-surround.enable = true;
  todo-comments.enable = true;
  trouble.enable = true;
}
