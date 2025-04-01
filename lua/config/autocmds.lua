-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local hl = vim.api.nvim_set_hl

local hl_bold = { bg = "NONE", bold = true }

local hl_set_bold = function(s)
  hl(0, s, hl_bold)
end

-- make cword underline
hl_set_bold("LspReferenceRead")
hl_set_bold("LspReferenceText")
hl_set_bold("LspReferenceWrite")

hl(0, "LspInlayHint", { fg = "#545c7e", underdashed = true })
