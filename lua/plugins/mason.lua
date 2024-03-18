require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls","pylsp","cmake"
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup{
  capabilities = capabilities,
}
lspconfig.pylsp.setup{
  capabilities = capabilities,}
lspconfig.cmake.setup{}
lspconfig.docker_compose_language_service.setup{}
lspconfig.jsonls.setup{}

