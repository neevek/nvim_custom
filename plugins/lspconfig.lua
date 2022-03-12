local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require "nvim-lsp-installer"

  lsp_installer.settings {
    ui = {
      icons = {
        server_installed = "﫟" ,
        server_pending = "",
        server_uninstalled = "✗",
      },
    },
  }

  lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {},
    }

    -- basic example to edit lsp server's options, disabling tsserver's inbuilt formatter
    if server.name == 'tsserver' then 
      opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
      end
    elseif server.name == "rust_analyzer" then
      opts.settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            disabled = { 'inactive-code' }
          }
        }
      }
       
      -- Initialize the LSP via rust-tools instead
      require("rust-tools").setup {
        -- The "server" property provided in rust-tools setup function are the
        -- settings rust-tools will provide to lspconfig during init.            -- 
        -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
        -- with the user's own settings (opts).
        -- rust-analyzer.diagnostics.disabled
        server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
      }
      server:attach_buffers()
      -- Only if standalone support is needed
      require("rust-tools").start_standalone_if_required()
    else
      server:setup(opts)
    end

    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
