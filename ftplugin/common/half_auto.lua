--
-- index 2 and auto format common configurations
--

local bo = vim.bo

bo.softtabstop = 2
bo.shiftwidth = 2
bo.tabstop = 2

---@diagnostic disable-next-line: inject-field
vim.b.autoformat = true
