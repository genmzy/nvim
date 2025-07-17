-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.root_spec = { "cwd" }
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.lazyvim_picker = "fzf"
vim.lsp.set_log_level("ERROR")

local opt = vim.opt

vim.o.mouse = ""

-- opt.listchars:append("eol:↵")
opt.listchars:append("tab:¦ ")
opt.listchars:append("trail:-")
opt.softtabstop = 4
opt.shiftwidth = 4
opt.tabstop = 4
opt.et = false
opt.guicursor = "a:blinkon800"
-- cursor
opt.guicursor =
  "n-v-c:underline,i-ci-ve:ver40,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

opt.fileencodings = "utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1"
opt.enc = "utf-8"
opt.fencs = "utf-8,gbk,gb2312,gb18030"

opt.wrap = false

-- set jumpopts to be stacked
opt.jop = "stack"
-- opt.winborder = "single"

-- always set dark to disable autochange
opt.background = "dark"
opt.winblend = 15
