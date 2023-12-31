--
-- database connection and layout
--

vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1

return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = { { "tpope/vim-dadbod" } },
  keys = { { "<leader>fd", "<cmd>tabnew<cr><cmd>DBUIToggle<cr>", desc = "Database layout" } },
  config = function()
    vim.cmd([[autocmd FileType dbui nmap <buffer> v <plug>(DBUI_SelectLineVsplit)]])
  end,
}
