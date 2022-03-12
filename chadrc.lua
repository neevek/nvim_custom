local M = {}
local userPlugins = require "custom.plugins"
local g = vim.g

g.gitblame_ignored_filetypes = {'NvimTree', 'packer'}

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
