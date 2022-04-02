-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>w", ":w <CR>")
map("n", "<F3>", ":NvimTreeToggle <CR>")
map("n", "tt", ":q <CR>")
map("n", "<space>", "viwye<space><ESC>")                -- yank word under cursor
map("n", "<space><space>", 'viw"_d"+Pa<ESC>')           -- replace word under cursor
map("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")
map("n", "<leader>t", ":SymbolsOutline <CR>")
map("n", "<leader>dd", ":DiffviewOpen HEAD")
map("n", "<leader>dc", ":DiffviewClose <CR>")
map("n", "<leader>df", ":DiffviewFileHistory <CR>")

vim.g.rustfmt_autosave = true

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
