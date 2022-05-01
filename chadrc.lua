local M = {}
local user_plugins = require "custom.plugins"
local custom_alpha = require "custom.plugins.alpha"
local custom_telescope = require "custom.plugins.telescope"

M.ui = {
  theme = "tokyodark",
  hl_override = "custom.highlights",
}

M.plugins = {
  options = {
    statusline = {
      separator_style = "arrow", -- default/round/slant/block/arrow
    },

    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = {
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

    ["akinsho/bufferline.nvim"] = {
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

    ["NvChad/nvterm"] = {
      mappings = {
        new = {
          horizontal = "<leader>a",
        },
      },
    },

    ["goolord/alpha-nvim"] = custom_alpha,
    ["nvim-telescope/telescope.nvim"] = custom_telescope,
  },

  user = user_plugins,
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
  },

  misc = function()
    vim.g.mapleader = ","

    -- enable rustfmt on save for .rs files
    vim.g.rustfmt_autosave = true

    -- settings for nathom/filetype.nvim
    vim.g.did_load_filetypes = 1

    -- symbols-outline.nvim configurations
    vim.g.symbols_outline = {
      auto_preview = false,
      show_numbers = true,
      relative_width = false,
      width = 40,

      keymaps = {
        close = {}, -- disable 'quit on ESC'
      },
    }

    -- avoid unwanted spaces in empty lines
    vim.g.autoindent = true

    -- Don't go to previous/next line with h,l,left arrow and right arrow
    -- when cursor reaches end/beginning of line
    vim.opt.whichwrap:remove "<>[]hl"

    -- Add borders to the diagnostic floating window
    vim.diagnostic.config({
      float = {
        source = 'always',
        border = 'single',
      },
    })

    local map = require("core.utils").map
    map("n", "<leader>cc", ":Telescope <CR>")
    map("n", "<leader>w", ":w <CR>")
    map("n", "<leader>q", ":qa <CR>")
    map("n", "tt", ":q <CR>")
    map("n", "<space>", "viwye<space><ESC>")                -- yank word under cursor
    map("n", "<space><space>", 'viw"_d"+Pa<ESC>')           -- replace word under cursor
    map("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")
    map("n", "<leader>t", ":SymbolsOutline <CR>")
    map("n", "<leader>dd", ":DiffviewOpen HEAD")
    map("n", "<leader>dc", ":DiffviewClose <CR>")
    map("n", "<leader>df", ":DiffviewFileHistory <CR>")
    map("n", "<leader>c", "<cmd> :Telescope command_history <CR>")
    map("i", "JK", "<ESC>")

    local buf_map = function(...)
      local key, lhs, rhs = ...
      map(key, lhs, rhs, { buffer = bufnr })
    end

    buf_map("n", "<leader>d", function()
      vim.lsp.buf.type_definition()
    end)

    buf_map("n", "<leader>ra", function()
      vim.lsp.buf.rename()
    end)

    buf_map("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end)

    buf_map("n", "gr", function()
      vim.lsp.buf.references()
    end)

    buf_map("n", "ge", function()
      vim.diagnostic.open_float()
    end)
  end,
}

return M
