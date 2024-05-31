-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local hl = vim.api.nvim_set_hl
local hl_underline = { bg = "NONE", underline = true }

local hl_set_underline = function(s)
  hl(0, s, hl_underline)
end

-- make cword underline
hl_set_underline("LspReferenceRead")
hl_set_underline("LspReferenceText")
hl_set_underline("LspReferenceWrite")

hl(0, "LspInlayHint", { fg = "#a0a79a", underdashed = true })
