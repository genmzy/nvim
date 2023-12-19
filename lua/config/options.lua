-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.root_spec = { { ".git", "lua" }, "cwd", "lsp" }

local opt = vim.opt

vim.o.mouse = ""
vim.g.python3_host_prog = "/usr/bin/python3"
-- opt.listchars:append("eol:↵")
opt.listchars:append("tab:¦ ")
opt.listchars:append("trail:▫")
opt.softtabstop = 4
opt.shiftwidth = 4
opt.tabstop = 4
opt.et = false
