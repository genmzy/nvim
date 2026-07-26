--
-- cpp file options
--

local fname = vim.fn.expand("%:t")

if require("util.str").has_suffix(fname, ".h.in") then
  -- set filetype to config to make lsp does not attach
  vim.bo.filetype = "config"
end
