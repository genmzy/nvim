-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.root_spec = {
  {
    ".git", -- general
    "go.mod", -- golang
    "stylua.toml", -- lua
    "build.gradle", -- java
    "pom.xml", -- java
    "Cargo.toml", -- rust
  },
  "cwd",
  "lsp",
}

local opt = vim.opt

vim.o.mouse = ""
vim.g.python3_host_prog = "/usr/bin/python3"
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
