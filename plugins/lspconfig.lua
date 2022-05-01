local M = {}

M.setup_lsp = function(attach, capabilities)
  require("nvim-lsp-installer").setup()
  require("lspconfig").clangd.setup({
      on_attach = attach,

      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
  })

  require("rust-tools").setup {
    server = {
      on_attach = attach,

      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },

      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            disabled = { 'inactive-code' }
          }
        }
      },
    }
  }
end

return M
