local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require("nvim-lsp-installer")
  local lspconfig = require("lspconfig")
  lsp_installer.setup()

  for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local opts = {
      on_attach = attach,

      flags = {
        debounce_text_changes = 150,
      },

      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
    }

    local sv;
    if server.name == "rust_analyzer" then
      sv = require("rust-tools")
      opts.settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            disabled = { 'inactive-code' }
          }
        }
      }
      opts = {
        server = opts
      }
    else
      sv = lspconfig[server.name]
    end

    sv.setup(opts)
  end
end

return M
