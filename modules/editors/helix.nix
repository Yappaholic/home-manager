{...}: let
  typescript = {
    name = "typescript";
    auto-format = true;
    formatter = {
      command = "prettierd";
    };
  };
  c3 = {
    name = "c3";
    file-types = ["c3" "c3i"];
    roots = ["project.json"];
    comment-token = "//";
    block-comment-tokens = {
      start = "/*";
      end = "*/";
    };
    language-servers = ["c3-lsp"];
    scope = "source.c3";
  };
  nix = {
    name = "nix";
    file-types = ["nix"];
    auto-format = true;
    formatter.command = "alejandra";
    language-servers = ["nixd"];
  };
  c3-grammar = {
    name = "c3";
    source = {
      git = "https://github.com/c3lang/tree-sitter-c3.git";
      rev = "main";
    };
  };
in {
  programs.helix = {
    enable = true;
    ignores = [
      ".build/"
      "bundle/"
      "node_modules/"
    ];
    settings = {
      theme = "kanagawa";
      editor = {
        line-number = "relative";
        mouse = false;
        completion-timeout = 5;
        lsp.display-messages = true;
        file-picker.hidden = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
        statusline = {
          left = ["mode"];
          center = ["file-name"];
          right = ["diagnostics" "position" "file-type"];
          separator = "|";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };
    };
    languages = {
      use-grammars = {
        only = [
          "rust"
          "c"
          "cpp"
          "typescript"
          "tsx"
          "jsx"
          "javascript"
          "toml"
          "yaml"
          "sway"
          "c3"
          "nix"
          "hyprlang"
          "python"
          "nu"
          "go"
          "bash"
          "css"
          "html"
          "lua"
          "ocaml"
          "vue"
          "zig"
        ];
      };
      language = [typescript c3 nix];
      grammar = [c3-grammar];
      language-server.c3-lsp = {
        command = "c3-lsp";
      };
      language-server.nixd = {
        command = "nixd";
        config = {
          nixd = {
            formatting.command = ["alejandra"];
            options = {
              home-manager.expr = "(builtins.getFlake \"/home/savvy/.config/home-manager\").homeConfigurations.\"savvy\".options";
            };
          };
        };
      };
    };
  };
}