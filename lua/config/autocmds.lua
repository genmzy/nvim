-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local hl = vim.api.nvim_set_hl

local hl_cword = { bg = "#343434" }

-- make cword color
local hl_set_cword = function(s)
  hl(0, s, hl_cword)
end
hl_set_cword("LspReferenceRead")
hl_set_cword("LspReferenceText")
hl_set_cword("LspReferenceWrite")

hl(0, "LspInlayHint", { fg = "#7c6f64", underdashed = true })
