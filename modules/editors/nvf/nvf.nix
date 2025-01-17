{pkgs, ...}: let
  languages = import ./languages.nix;
  lsp = import ./lsp.nix;
in {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        enableLuaLoader = true;
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        options = {
          autoindent = false;
          shiftwidth = 2;
          tabstop = 2;
        };
        inherit languages;
        inherit lsp;
    statusline.lualine.enable = true;
    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    dashboard.dashboard-nvim.enable = true;
    notes.todo-comments.enable = true;
    snippets.luasnip.enable = true;
    undoFile.enable = true;
    visuals.indent-blankline.enable = true;
    visuals.nvim-web-devicons.enable = true;
    ui = {
      noice.enable = true;
      smartcolumn = {
        enable = true;
        setupOpts.colorcolumn = "80";
      };
    };
    extraPlugins = with pkgs.vimPlugins; {
      harpoon = {
        package = harpoon;
        setup = ''          require('harpoon').setup{
			  harpoon:setup()

			  vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			  vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			  vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
			  vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
			  vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
			  vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

			  -- Toggle previous & next buffers stored within Harpoon list
			  vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
			  vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)}'';
      };
    };
  };
    };
      };
}
