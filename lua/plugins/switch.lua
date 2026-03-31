--
-- quick switch
--

vim.g.switch_custom_definitions = {
  { "> [!TODO]", "> [!WIP]", "> [!DONE]", "> [!FAIL]" },
  { "- [ ]", "- [>]", "- [x]" },
  { "height", "width" },
}

vim.g.switch_mapping = "<S-Tab>"

return {
  "AndrewRadev/switch.vim",
}
