return { 
 "theprimeagen/harpoon",
 "rebelot/kanagawa.nvim",
 "lambdalisue/vim-suda",
 "gentoo/gentoo-syntax",
 {
   "folke/which-key.nvim",
   event = "VeryLazy",
   opts = {
     -- your configuration comes here
     -- or leave it empty to use the default settings
     -- refer to the configuration section below
     preset = "helix",
     win = {
       width = { min = 4, max = 40},
       height = { min = 4, max = 15},
     },
     layout = {
       width = {min = 4, max = 30}
     },
   },
   keys = {
     {
       "<leader>?",
       function()
         require("which-key").show({ global = false })
       end,
       desc = "Buffer Local Keymaps (which-key)",
     },
   },
 },
 {
   "kak.nvim",
   url = "https://codeberg.org/mirge/kak.nvim.git",
   --version = "^6", -- if you don't want breaking changes
   event = "VeryLazy", -- load after other plugins, to avoid conflicts
   opts = {
     -- your configuration here
   },
 },
 {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = true },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
},
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
