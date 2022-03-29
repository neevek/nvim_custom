local M = {}
local user_plugins = require "custom.plugins"
local custom_alpha = require "custom.plugins.alpha"

M.options = {
  mapleader = ",",
}

M.ui = {
  theme = "tokyodark",
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

    alpha = {
      buttons = custom_alpha.buttons,
    },
  },

  install = user_plugins,
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
