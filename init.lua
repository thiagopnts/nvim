-- TODO: we rely on a few binaries, add list here:
-- - fzf
-- - ripgrep
-- - lazygit
--local get_setup = function(name)
--  return string.format 'require("setup/%s")', name
--end
--

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- client for language servers
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use("rafamadriz/friendly-snippets")
  use("folke/lua-dev.nvim")
  use("triglav/vim-visual-increment")
  use("hrsh7th/cmp-copilot")
  use("github/copilot.vim")
  -- TODO: learn more about
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("jose-elias-alvarez/null-ls.nvim")
  use("onsails/lspkind.nvim")
  use("axelf4/vim-strip-trailing-whitespace") -- remove trailing whitespace
  use("kyazdani42/nvim-web-devicons") -- for file icons
  use("tpope/vim-fugitive")
  use("christoomey/vim-tmux-navigator")
  use("cespare/vim-toml") -- toml syntax highlight
  use("LnL7/vim-nix") -- nix syntax support
  use("ray-x/lsp_signature.nvim") -- show function signature when you type
  -- repeat unrepeatable commands
  use("tpope/vim-repeat")
  -- classic surround plugin
  use("tpope/vim-surround")
  use("hashivim/vim-terraform")
  use("simrat39/rust-tools.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  -- colorschemes
  use("rebelot/kanagawa.nvim")
  use("folke/tokyonight.nvim")
  --  use({ "akinsho/toggleterm.nvim", tag = "v1.*" })
  use({ "nvim-telescope/telescope-fzy-native.nvim", run = "make" })
  --use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-context")
  use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
  use({
    "ray-x/go.nvim",
    {
      requires = {
        { "ray-x/guihua.lua" },
      },
    },
  })
  use({
    "williamboman/nvim-lsp-installer",
    {
      requires = {
        { "neovim/nvim-lspconfig" },
        { "folke/lua-dev.nvim" },
        { "ray-x/go.nvim" },
      },
    },
  })
  use({
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
  })
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      vim.g.symbols_outline = {
        width = 13,
        symbols = {
          Function = { icon = "", hl = "TSFunction" },
        },
      }
    end,
  })
  use({
    "esensar/nvim-dev-container",
    requires = { { "nvim-treesitter/nvim-treesitter" } },
    config = function()
      require("devcontainer").setup({})
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  })
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  })
  use({
    "bkad/CamelCaseMotion", -- can jump between camel|snakecase words
    config = function()
      vim.g.camelcasemotion_key = ","
    end,
  })
  use({
    "folke/trouble.nvim", -- rust lang support
    config = function()
      require("trouble").setup({})
    end,
  })
  use({
    "APZelos/blamer.nvim", -- show commit/blame current line
    config = function()
      vim.g.blamer_enabled = 1
    end,
  })
  use({
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      -- lualine config based off eviline from @shadmansaleh
      local lualine = require("lualine")
      local kanagawa = require("kanagawa.colors")

      local colorscheme = kanagawa.setup()
      local colors = {
        fg = colorscheme.oldWhite,
        bg = colorscheme.sumiInk0,
        black = colorscheme.sumiInk0,
        white = colorscheme.oldWhite,
        green = colorscheme.springGreen,
        red = colorscheme.peachRed,
        orange = colorscheme.surimiOrange,
        blue = colorscheme.springBlue,
        cyan = colorscheme.crystalBlue,
        darkblue = colorscheme.waveBlue1,
        magenta = colorscheme.oniViolet,
        violet = colorscheme.oniViolet,
        yellow = colorscheme.carpYellow,
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local config = {
        options = {
          -- Disable sections and component separators
          component_separators = "",
          section_separators = "",
          theme = "auto",
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x ot right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left({
        function()
          return "▊"
        end,
        color = { fg = colors.blue }, -- Sets highlighting of component
        padding = { left = 0, right = 1 }, -- We don't need space before this
      })

      ins_left({
        -- mode component
        function()
          return ""
        end,
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { right = 1 },
      })

      ins_left({
        "filesize",
        cond = conditions.buffer_not_empty,
      })

      ins_left({
        "filetype",
        fmt = string.upper,
        icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
        color = { fg = colors.green, gui = "bold" },
      })

      -- lets keep filename on the winbar for now
      -- ins_left({
      --   "filename",
      --   cond = conditions.buffer_not_empty,
      --   color = { fg = colors.magenta, gui = "bold" },
      -- })

      ins_left({ "location" })

      ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

      ins_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      })

      -- Insert mid section. You can make any number of sections in neovim :)
      -- for lualine it's any number greater then 2
      ins_left({
        function()
          return "%="
        end,
      })

      ins_left({
        -- Lsp server name .
        function()
          local msg = "No Active LSP"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
              return client.name
            end
          end
          return msg
        end,
        icon = " ",
        color = { fg = colors.white, gui = "bold" },
      })

      -- Add components to right sections
      ins_right({
        "diff",
        symbols = { added = " ", modified = "柳", removed = " " },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      })

      ins_right({
        "o:encoding", -- option component same as &encoding in viml
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = { fg = colors.green, gui = "bold" },
      })

      ins_right({
        "fileformat",
        fmt = string.upper,
        icons_enabled = true,
        color = { fg = colors.green, gui = "bold" },
      })

      ins_right({
        "branch",
        icon = "",
        color = { fg = colors.violet, gui = "bold" },
      })

      ins_right({
        function()
          return "▊"
        end,
        color = { fg = colors.blue },
        padding = { left = 1 },
      })

      lualine.setup(config)
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      vim.g.nvim_tree_side = "left"
      vim.g.nvim_tree_width = 25
      vim.g.nvim_tree_git_hl = 1
      vim.g.nvim_tree_root_folder_modifier = ":t"
      vim.g.nvim_tree_allow_resize = 1
      require("nvim-tree").setup({
        open_on_setup = false,
        auto_close = false,
        open_on_tab = false,
        indent_markers = true,
        disable_window_picker = true,
        quit_on_open = true,
        update_focused_file = { enable = true },
        git = {
          enable = false,
          auto_open = false,
        },
        filters = {
          dotfiles = true,
          custom = { ".git", "node_modules", ".cache" },
        },
      })
    end,
  })
end)

require("setup/opts")
require("setup/mappings")
require("setup/cmp")
require("setup/lsp")
require("setup/telescope")
--require("setup/toggleterm")

--local saga = require("lspsaga")
--saga.init_lsp_saga({
--	error_sign = "●",
--	warn_sign = "●",
--	hint_sign = " ",
--	infor_sign = " ",
--	rename_prompt_prefix = "",
--})

require("nvim-treesitter.configs").setup({
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
})

-- Uses TreesitterContext hightlight group, which defaults to values from NormalFloat
require("treesitter-context").setup()

vim.g.indent_blankline_show_current_context = true

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
vim.cmd([[colorscheme kanagawa]])
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
