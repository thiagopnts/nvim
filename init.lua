--local get_setup = function(name)
--  return string.format 'require("setup/%s")', name
--end

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  -- client for language servers
  use "neovim/nvim-lspconfig"
  use "simrat39/symbols-outline.nvim"
  use "rafamadriz/friendly-snippets"
  use "folke/lua-dev.nvim"
  use "triglav/vim-visual-increment"
  use {
    "ray-x/go.nvim",
    {
      requires = {
        { "ray-x/guihua.lua" },
      },
    },
  }
  use "simrat39/rust-tools.nvim"
  use {
    "williamboman/nvim-lsp-installer",
    {
      requires = {
        { "neovim/nvim-lspconfig" },
        { "folke/lua-dev.nvim" },
        { "ray-x/go.nvim" },
      },
    },
  }
  use "github/copilot.vim"
  -- repeat unrepeatable commands
  use "tpope/vim-repeat"
  use "hashivim/vim-terraform"
  -- classic surround plugin
  use "tpope/vim-surround"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },
      { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
    },
  }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  -- TODO: learn more about
  use "nvim-treesitter/nvim-treesitter-textobjects"

  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "folke/trouble.nvim", -- rust lang support
    config = function()
      require("trouble").setup {}
    end,
  }

  use "axelf4/vim-strip-trailing-whitespace" -- remove trailing whitespace
  use "kyazdani42/nvim-web-devicons" -- for file icons
  use "tpope/vim-fugitive"
  use "christoomey/vim-tmux-navigator"

  use "cespare/vim-toml" -- toml syntax highlight
  use "ray-x/lsp_signature.nvim" -- show function signature when you type

  use {
    "esensar/nvim-dev-container",
    requires = { { "nvim-treesitter/nvim-treesitter" } },
    config = function()
      require("devcontainer").setup {}
    end,
  }
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  }
  use "LnL7/vim-nix" -- nix syntax support
  use {
    "APZelos/blamer.nvim", -- show commit/blame current line
    config = function()
      vim.g.blamer_enabled = 1
    end,
  }
  use {
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      -- require("lualine").setup({ options = { theme = "jellybeans" } })
      require("lualine").setup {
        options = {
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
      }
    end,
  }
  use {
    "bkad/CamelCaseMotion", -- can jump between camel|snakecase words
    config = function()
      vim.g.camelcasemotion_key = ","
    end,
  }
  use "onsails/lspkind.nvim"
  use {
    "lewis6991/gitsigns.nvim", -- git.... signs
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr" },
          change = { hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr" },
          delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
          topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
          changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
        },

        numhl = false,
        keymaps = {
          -- Default keymap options
          noremap = true,
          buffer = true,
          ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
          ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
          ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
          ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
          ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
          ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
          ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
        },
        watch_gitdir = {
          interval = 100,
        },
        sign_priority = 5,
        status_formatter = nil, -- Use default
      }
    end,
  }
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      vim.g.nvim_tree_side = "left"
      vim.g.nvim_tree_width = 25
      vim.g.nvim_tree_git_hl = 1
      vim.g.nvim_tree_root_folder_modifier = ":t"
      vim.g.nvim_tree_allow_resize = 1
      require("nvim-tree").setup {
        open_on_setup = false,
        auto_close = false,
        open_on_tab = false,
        --indent_markers = true,
        disable_window_picker = true,
        quit_on_open = true,
        update_focused_file = { enable = false },
        git = {
          enable = false,
          auto_open = false,
        },
        filters = {
          dotfiles = true,
          custom = { ".git", "node_modules", ".cache" },
        },
      }
    end,
  }
  use { "nvim-telescope/telescope-fzy-native.nvim", run = "make" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = function() end,
  }
  -- colorschemes
  use "rebelot/kanagawa.nvim"
  use "folke/tokyonight.nvim"
end)

require "setup/opts"
require "setup/mappings"
require "setup/cmp"
require "setup/lsp"
require "setup/telescope"

local signs = { Error = "●", Warn = "●", Hint = "", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--local saga = require("lspsaga")
--saga.init_lsp_saga({
--	error_sign = "●",
--	warn_sign = "●",
--	hint_sign = " ",
--	infor_sign = " ",
--	rename_prompt_prefix = "",
--})

require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("indent_blankline").setup {
  show_end_of_line = true,
  show_current_context = true,
  space_char_blankline = " ",
  show_current_context_start = true,
}

require("lsp_signature").setup {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  hint_prefix = "",
  handler_opts = {
    border = "rounded",
  },
}

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]]
vim.cmd "filetype plugin indent on"
vim.cmd "syntax enable"
vim.cmd "set termguicolors"
vim.cmd [[colorscheme kanagawa]]
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
