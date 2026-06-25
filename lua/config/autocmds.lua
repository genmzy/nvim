-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local hl = vim.api.nvim_set_hl
hl(0, "LspInlayHint", { fg = "#a0a79a", underdashed = true })

-- fix vim-goasm cover all *.s filetype to goasm
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.s",
  callback = function(args)
    local buf = args.buf
    if vim.fs.root(buf, "go.mod") then
      vim.bo[buf].filetype = "goasm"
    else
      vim.bo[buf].filetype = "asm"
    end
  end,
})
