[
  {
    action = "<cmd>Oil<CR>";
    key = "<leader>p.";
  }
  {
    action = "<cmd>Neogit<CR>";
    key = "<leader>gg";
  }
  {
    action = "<cmd>term<CR>";
    key = "<leader>oT";
  }

  # LSP related
  {
    action = "<cmd>lua vim.lsp.buf.hover()<CR>";
    key = "<leader>k";
  }
  {
    action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
    key = "gD";
  }
  {
    action = "<cmd>lua vim.lsp.buf.definition()<CR>";
    key = "gd";
  }
  {
    action = "<cmd>Trouble diagnostics toggle<CR>";
    key = "<leader>d";
  }

  # Telescope
  {
    action = "<cmd>Telescope find_files<CR>";
    key = "<leader>ff";
  }
  {
    action = "<cmd>Telescope live_grep<CR>";
    key = "<leader>lg";
  }
  {
    action = "<cmd>Telescope projects<CR>";
    key = "<leader>fp";
  }

  # Stop highlighting
  {
    action = "<cmd>noh<CR>";
    key = "<c-g>";
  }

  # Harpoon
  {
    action.__raw = "function() require'harpoon':list():add() end";
    key = "<leader>a";
  }
  {
    action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    key = "<leader>h";
  }
  {
    action.__raw = "function() require'harpoon':list():select(1) end";
    key = "<M-1>";
  }
  {
    action.__raw = "function() require'harpoon':list():select(2) end";
    key = "<M-2>";
  }
  {
    action.__raw = "function() require'harpoon':list():select(3) end";
    key = "<M-3>";
  }
  {
    action.__raw = "function() require'harpoon':list():select(4) end";
    key = "<M-4>";
  }
]
