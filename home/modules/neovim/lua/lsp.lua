local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function setup_server(name, settings)
   require("lspconfig")[name].setup{
      capabilities = capabilities,
      settings = settings
   }
end

setup_server("pylsp", {})
setup_server("nixd", {})

setup_server("lua_ls", {
   Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
         library = vim.api.nvim_get_runtime_file("", true),
         checkThirdParty = false,
      },
      telemetry = { enable = false },
   }
})
