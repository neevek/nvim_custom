local M = {
  defaults = {
    layout_config = {
      width = 0.9,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor {
        -- more opts
      },
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  },
}

return M
