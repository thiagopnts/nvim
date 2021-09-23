-- initialize and setup plugin manager
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- prepare to define plugins
local use = require("packer").use
require("packer").startup(
  function()
    -- Package manager itself
    use "wbthomason/packer.nvim"
    use "ray-x/lsp_signature.nvim" -- show function signature when you type
    use "cespare/vim-toml" -- toml syntax highlight
    use "axelf4/vim-strip-trailing-whitespace" -- remove trailing whitespace
    use "kyazdani42/nvim-web-devicons" -- for file icons
    use "tpope/vim-fugitive"
    use "christoomey/vim-tmux-navigator"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    -- jellybeans colorscheme and its dependency lush
    use "rktjmp/lush.nvim"
    use "adisen99/jellybeans-nvim"
    use "tpope/vim-repeat" -- repeat unrepeatable commands
    use "tpope/vim-surround" -- classic surround plugin
    use "hrsh7th/nvim-compe" -- auto completion plugin
    use "hrsh7th/vim-vsnip" -- snippets
    use "hrsh7th/vim-vsnip-integ" -- vsnip integration for nvim-compe
    use "LnL7/vim-nix" -- nix syntax support
    use "glepnir/galaxyline.nvim" -- status line
    -- fancy & powerful grep lib
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "nvim-treesitter.configs".setup {highlight = {enable = true}}
      end
    }
    use "neovim/nvim-lspconfig" -- client for language servers
    use {
      "bkad/CamelCaseMotion", -- can jump between camel|snakecase words
      config = function()
        vim.g.camelcasemotion_key = ","
      end
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end
    }
    -- auto close pairs
    use {
      "windwp/nvim-autopairs",
      config = function()
        require "nvim-autopairs".setup {}
      end
    }
    -- vim-go like
    use {
      "crispgm/nvim-go",
      config = function()
        require "go".setup {auto_lint = false}
      end
    }
    use {
      "rust-lang/rust.vim", -- rust lang support
      config = function()
        vim.g.rustfmt_autosave = 1
      end
    }
    use {
      "lewis6991/gitsigns.nvim", -- git.... signs
      config = function()
        require "gitsigns".setup {
          signs = {
            add = {hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr"},
            change = {hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr"},
            delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
            topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
            changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
          },
          numhl = false,
          keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
            ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
            ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
            ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
          },
          watch_index = {
            interval = 100
          },
          sign_priority = 5,
          status_formatter = nil -- Use default
        }
      end
    }
    use {
      "akinsho/nvim-bufferline.lua", -- top tabs bar
      config = function()
        require "bufferline".setup {
          options = {
            offsets = {{filetype = "NvimTree", text = "", padding = 1}},
            buffer_close_icon = "",
            modified_icon = "",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 14,
            max_prefix_length = 13,
            tab_size = 20,
            show_tab_indicators = true,
            enforce_regular_tabs = false,
            view = "multiwindow",
            show_buffer_close_icons = true,
            separator_style = "thin",
            --mappings = "true"
          }
        }
      end
    }
    use {
      "andweeb/presence.nvim",
      config = function()
        require("presence"):setup {
          editing_text = "Coding %s"
        }
      end
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        vim.g.indentLine_enabled = 1
--        vim.g.indent_blankline_char = "│"
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
        vim.g.indent_blankline_buftype_exclude = {"terminal"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end
    }
    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        vim.g.nvim_tree_side = "left"
        vim.g.nvim_tree_width = 25
        vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
        vim.g.nvim_tree_auto_open = 0
        vim.g.nvim_tree_auto_close = 0
        vim.g.nvim_tree_quit_on_open = 0
        vim.g.nvim_tree_follow = 1
        vim.g.nvim_tree_indent_markers = 1
        vim.g.nvim_tree_hide_dotfiles = 1
        vim.g.nvim_tree_git_hl = 1
        vim.g.nvim_tree_root_folder_modifier = ":t"
        vim.g.nvim_tree_tab_open = 0
        vim.g.nvim_tree_allow_resize = 1
        vim.g.nvim_tree_show_icons = {
          git = 1,
          folders = 1,
          files = 1
        }
        vim.g.nvim_tree_icons = {
          default = " ",
          symlink = " ",
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
          },
          folder = {
            default = "",
            open = "",
            symlink = "",
            empty = "",
            empty_open = "",
            symlink_open = ""
          }
        }
      end
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = function()
        require "telescope".setup {
          defaults = {
            vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case"
            },
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                mirror = false
              },
              vertical = {
                mirror = false
              }
            },
            file_sorter = require "telescope.sorters".get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
            winblend = 0,
            border = {},
            borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
            color_devicons = true,
            use_less = true,
            path_display = {},
            set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
            file_previewer = require "telescope.previewers".vim_buffer_cat.new,
            grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
            qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
          }
        }
      end
    }
  end
)
vim.api.nvim_command("colorscheme jellybeans")

require("opts")
require("_mappings")

require("_lspconfig")
require("_galaxyline")
require("_compe")
require("_formatter")
