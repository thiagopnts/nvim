vim.cmd "packadd paq-nvim" -- load paq package manager

require "paq-nvim" {
  "savq/paq-nvim", -- package manager
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}, -- parser generator tool for better syntax highlight
  "nvim-treesitter/playground", -- useful for checking the diff between treesitter vs no treesitter
  "neovim/nvim-lspconfig", -- client for language servers
  "bkad/CamelCaseMotion", -- can jump between camel|snakecase words
  "tpope/vim-repeat", -- repeat unrepeatable commands
  "tpope/vim-surround", -- classic surround plugin
  "hrsh7th/nvim-compe", -- auto completion plugin
  "hrsh7th/vim-vsnip", -- snippets
  "hrsh7th/vim-vsnip-integ", -- vsnip integration for nvim-compe
  "golang/vscode-go",
  "nvim-lua/popup.nvim", -- telescope dependency
  "nvim-lua/plenary.nvim", -- telescope/gitsigns dependency
  "nvim-telescope/telescope.nvim", -- better fzf so they say
  "steelsojka/pears.nvim", -- auto close pairs
  "ojroques/nvim-hardline", -- like airline
  "crispgm/nvim-go", -- vim-go like
  "rust-lang/rust.vim", -- rust lang support
  "lewis6991/gitsigns.nvim", -- git.... signs
  "rktjmp/lush.nvim",
  "ray-x/lsp_signature.nvim",
  "mhartington/formatter.nvim",
  "folke/lsp-colors.nvim", -- might not be needed, remember to delete
  "axelf4/vim-strip-trailing-whitespace", -- remove trailing whitespace
  -- FIXME these 2 are not working properly might be worth removing
  "kyazdani42/nvim-web-devicons", -- for file icons
  "kyazdani42/nvim-tree.lua",
  "christoomey/vim-tmux-navigator",
  -- colorschemes
  "ray-x/aurora",
  "yonlu/omni.vim",
  "jacoborus/tender.vim",
  "folke/tokyonight.nvim",
  "nanotech/jellybeans.vim", -- best colorscheme :)
  "adisen99/jellybeans-nvim"
}
