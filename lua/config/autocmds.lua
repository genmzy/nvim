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

-- ignore terminal wake up in overseer filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "OverseerList", "OverseerOutput" },
  callback = function() -- set nop to ignore keys for buffer
    vim.keymap.set("n", "<c-/>", "<nop>", { buffer = true })
    vim.keymap.set("t", "<c-/>", "<nop>", { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.log",
  callback = function()
    vim.opt_local.wrap = true
    -- make words unsplit
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    -- show line break identifier at the front of new line
    vim.opt_local.showbreak = "  "
    vim.opt_local.textwidth = 0
    vim.opt_local.sidescrolloff = 0
  end,
})
