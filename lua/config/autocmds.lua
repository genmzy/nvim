-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local hl = vim.api.nvim_set_hl

hl(0, "LspReferenceRead", { bg = "NONE", underline = true })
hl(0, "LspReferenceText", { bg = "NONE", underline = true })
hl(0, "LspReferenceWrite", { bg = "NONE", underline = true })
