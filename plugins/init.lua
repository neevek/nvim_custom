return {
  ["williamboman/nvim-lsp-installer"] = {
    -- after = "nvim-lspconfig",
    -- setup = function()
    --   require("nvim-lsp-installer").setup({
    --     ensure_installed = { "clangd", "rust_analyzer" },
    --   })
    -- end,
  },

  ["simrat39/rust-tools.nvim"] = { },

  ["simrat39/symbols-outline.nvim"] = { },

  ["sindrets/diffview.nvim"] = {
    -- after = "plenary.nvim",
    -- opt = true,
  },

  ["rust-lang/rust.vim"] = {
    -- opt = true,
  },

  ["nathom/filetype.nvim"] = { },

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    opt = true,
    setup = function()
      local map = require("core.utils").map
      map("n", "<F3>", ":NvimTreeToggle <CR>")
    end,
  },

  ["akinsho/bufferline.nvim"] = {
    tag = "main",

    setup = function()
      local map = require("core.utils").map
      map("n", "H", "<cmd> :BufferLineCyclePrev <CR>")
      map("n", "L", "<cmd> :BufferLineCycleNext <CR>")
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = false,
  },

  ["nvim-telescope/telescope-ui-select.nvim"] = {
    after = "telescope.nvim",

    setup = function()
      local map = require("core.utils").map
      map("n", "<TAB>", "<cmd> :lua vim.lsp.buf.code_action()<CR>")
    end,

    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",

    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  ["L3MON4D3/LuaSnip"] = {
    config = function()
      require("luasnip/loaders/from_vscode").load { paths = { "./lua/custom/vs_snippets" } }
    end,
  },
}
