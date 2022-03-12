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

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
