local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- from ray-x/lsp_signature.nvim, enables signature help pop up
  require("lsp_signature").on_attach {
    bind = true,
    hint_enable = false,
    handler_opts = {
      border = "single"
    }
  }

  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- TODO: use the new commands we defined above instead of the full call
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<space>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.js", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  },
  psalm = {
    sourceName = "psalm",
    command = "psalm",
    rootPatterns = {"psalm.xml", "composer.json"},
    debounce = 100,
    args = {"--output-format", ".json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}

local formatters = {
  prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}

local formatFiletypes = {
  typescript = "prettier",
  typescriptreact = "prettier"
}

-- this simplifies lsp calls so its not 3km long
vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
vim.cmd("command! LspOrganize lua lsp_organize_imports()")
vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

-- the lua lang server is kind of a mess, on linux I'm using an AUR version and on macos
-- its built from source
local cmd = {"lua-language-server"}
-- for some reason on macos you need this whole fucking thing for this to work
if vim.fn.has("mac") == 1 then
  local user = vim.fn.expand("$USER")
  -- I built from source, so I'm just pointing to the location where the final binary/entry is
  local sumneko_root_path = "/Users/" .. user .. "/src/lua-language-server"
  local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"}
end

local lsps = {
  pylsp = {on_attach = on_attach, capabilities = capabilities},
  gopls = {on_attach = on_attach, capabilities = capabilities},
  rust_analyzer = {on_attach = on_attach, capabilities = capabilities},
  phpactor = {on_attach = on_attach, capabilities = capabilities},
  bashls = {on_attach = on_attach, capabilities = capabilities},
  rnix = {},
  diagnosticls = {
    on_attach = on_attach,
    init_options = {
      linters = linters,
      formatters = formatters,
      formatFiletypes = formatFiletypes
    }
  },
  tsserver = {
    -- lsp configs for typescript/javascript
    -- external dependencies can be installed with:
    -- yarn global add typescript typescript-language-server \
    -- diagnostic-languageserver eslint_d prettier lua-fmt
    on_attach = function(client, bufnr)
      -- disable formatting so it can be handled by prettier instead
      client.resolved_capabilities.document_formatting = false
      on_attach(client, bufnr)
    end
  },
  sumneko_lua = {
    -- you need to have lua-language-server in your path
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = cmd,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT", -- set lua version to LuaJIT given we only use lua for neovim
          path = vim.split(package.path, ";") -- set lua path
        },
        diagnostics = {
          globals = {"vim"}
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        }
      }
    }
  }
}

for lang_server, config in pairs(lsps) do
  lspconfig[lang_server].setup(config)
end
