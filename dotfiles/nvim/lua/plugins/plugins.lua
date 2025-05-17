return { 
 "theprimeagen/harpoon",
 "rebelot/kanagawa.nvim",
 "gentoo/gentoo-syntax",
 {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
},
 "stevearc/conform.nvim",
 "nvim-lualine/lualine.nvim",
 "R-nvim/R.nvim",
 'nyoom-engineering/oxocarbon.nvim',
 {'nvim-telescope/telescope.nvim', tag = '0.1.8'},
 {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
 -- LSP
 {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
 {'neovim/nvim-lspconfig'},
 "williamboman/mason.nvim",
 "williamboman/mason-lspconfig.nvim",
 -- Autocompletion
 {'hrsh7th/cmp-nvim-lsp'},
 {'hrsh7th/cmp-buffer'},
 {'hrsh7th/cmp-path'},
 {'saadparwaiz1/cmp_luasnip'},
 {'hrsh7th/nvim-cmp'},
 -- Snippets
 {'L3MON4D3/LuaSnip', version = "v2.*",
   dependencies = {'rafamadriz/friendly-snippets'},
 },
 'Civitasv/cmake-tools.nvim',
 {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>d",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
},
{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
},
{"folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
},
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
},
}
