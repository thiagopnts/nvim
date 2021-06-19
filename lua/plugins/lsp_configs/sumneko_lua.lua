local common = require("plugins.lsp_configs.common")
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

return {
  -- you need to have lua-language-server in your path
  capabilities = common.capabilities,
  on_attach = common.on_attach,
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
