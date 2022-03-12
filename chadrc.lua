local M = {}
local userPlugins = require "custom.plugins"
local g = vim.g

-- git_blame configurations
g.gitblame_ignored_filetypes = {
  'NvimTree',
  'packer',
  'Outline',
  'DiffviewFiles',
  'DiffviewFileHistory',
}

-- symbols-outline.nvim configurations
g.symbols_outline = {
  auto_preview = false,
  show_numbers = true,
  keymaps = {
    close = {}, -- disable 'quit on ESC'
  },
}


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
      },
      filters = {
        dotfiles = true,
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
