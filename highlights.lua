local colors = require("colors").get()
local ui = require("core.utils").load_config().ui

local fg = require("core.utils").fg
local fg_bg = require("core.utils").fg_bg
local bg = require("core.utils").bg

fg("TelescopeBorder", colors.yellow, colors.black2)
fg("TelescopePromptBorder", colors.yellow, colors.black2)
fg("TelescopePromptCounter", colors.yellow)
fg_bg("TelescopePreviewTitle", colors.orange, colors.black2)
fg_bg("TelescopePromptTitle", colors.orange, colors.black2)
fg_bg("TelescopeResultsTitle", colors.orange, colors.black2)
fg_bg("TelescopeSelection", colors.yellow, colors.grey)

fg("AlphaHeader", colors.nord_blue)
fg("AlphaButtons", colors.nord_blue)

fg("NvimTreeFolderName", colors.nord_blue)
fg("NvimTreeOpenedFolderName", colors.purple)

vim.cmd("hi Comment guifg=#7c7c7c")
vim.cmd("hi VertSplit guifg=#3c3c3c")
vim.cmd("hi StatusLineNC guifg=#3c3c3c")
