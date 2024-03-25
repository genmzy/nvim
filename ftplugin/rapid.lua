--
-- set some rapid filetype file to gomod
--

if vim.fn.expand("%:t") == "go.mod" then
  vim.bo.filetype = "gomod"
end
