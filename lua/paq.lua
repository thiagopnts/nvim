vim.cmd 'packadd paq-nvim' -- load paq package manager

require 'paq-nvim' {
	'savq/paq-nvim'; -- package manager
	'nanotech/jellybeans.vim', -- best colorscheme :)
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }; -- parser generator tool for better syntax highlight
	'nvim-treesitter/playground'; -- useful for checking the diff between treesitter vs no treesitter
	'neovim/nvim-lspconfig'; -- client for language servers
	'bkad/CamelCaseMotion'; -- can jump between camel|snakecase words
	'tpope/vim-repeat'; -- repeat unrepeatable commands
	'tpope/vim-surround'; -- classic surround plugin
	'hrsh7th/nvim-compe'; -- auto completion plugin
  'hrsh7th/vim-vsnip'; -- snippets
  'hrsh7th/vim-vsnip-integ'; -- vsnip integration for nvim-compe
	'nvim-lua/popup.nvim'; -- telescope dependency
	'nvim-lua/plenary.nvim'; -- telescope/gitsigns dependency
	'nvim-telescope/telescope.nvim';  -- better fzf so they say
	'steelsojka/pears.nvim'; -- auto close pairs
  'ojroques/nvim-hardline'; -- like airline
  'crispgm/nvim-go'; -- vim-go like
  'rust-lang/rust.vim'; -- rust lang support
  'lewis6991/gitsigns.nvim'; -- git.... signs
  'rktjmp/lush.nvim';
  'adisen99/jellybeans-nvim';
  'ray-x/lsp_signature.nvim';
  'folke/tokyonight.nvim';
  'folke/lsp-colors.nvim'; -- might not be needed, remember to delete
}
