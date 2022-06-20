local lspkind = require("lspkind")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")
cmp.setup({
  experimental = {
    -- setting this to false because it can be annoying
    -- while using with copilot
    ghost_text = false,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    --    fields = { "menu", "abbr", "kind" },
    format = lspkind.cmp_format({
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        luasnip = "[snip]",
        copilot = "[🤖]",
      },
      --      with_text = true,
      mode = "symbol_text",
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- pick the closest snipet completion match out of all sources
    ["<C-s>"] = cmp.mapping.complete({
      config = {
        sources = {
          { name = "luasnip" },
        },
      },
    }),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- jump to next placeholder in the snippet
    ["<C-d>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- jump to previous placeholder in the snippet
    ["<C-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "copilot" },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline("/", {
--  --mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = "buffer" },
--  },
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(":", {
--  --mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = "cmdline" },
--  },
--})
