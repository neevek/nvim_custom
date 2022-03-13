local M = {}
local userPlugins = require "custom.plugins"

M.options = {
  mapleader = ",",
}

M.ui = {
  theme = "onedark-deep",
}

M.plugins = {

  status = {
    alpha = true,
  },

  options = {
    statusline = {
      style = "arrow",
    },

    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  default_plugin_config_replace = {
    nvim_tree = {
      view = {
        width = 40,
        mappings = {
          list = {
            { key = {"i"}, action = "split" },
            { key = {"o"}, action = "vsplit" },
          }
        }
      },
      filters = {
        dotfiles = true,
      },
    },

    bufferline = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match "error" and " " or " "
          return " " .. icon .. count
        end,
      },

      highlights = {
        close_button_selected = {
          guifg = '#6c7d9c',
        },
      },

    },
  },

  install = userPlugins,
}

M.mappings = {
  terminal = {
    new_horizontal = "<leader>a",
    pick_term = "<leader>A",
  },

  plugins = {
    bufferline = {
      prev_buffer = "H",
      next_buffer = "L",
    },
  }
}

return M
