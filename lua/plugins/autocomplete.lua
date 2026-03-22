--
-- code complete
--

local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match("%s") == nil
end

return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        -- perhaps should use more c-l instead of tab and enter
        ["<C-o>"] = { "snippet_backward" },
        -- c-j and c-k disable fallback
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev" },
        -- disable blink default c-p select prev, keep c-n select next
        ["<C-p>"] = {},
        ["<C-l>"] = {
          "snippet_forward",
          function(cmp)
            return has_words_before() and cmp.show_and_insert()
          end,
        },
        ["<Tab>"] = {
          function(cmp)
            return has_words_before() and cmp.show_and_insert() or false
          end,
          "select_next",
          "fallback",
        },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        -- ignore c-w(close-and-fallback) and c-u(close-fallabck), c-e(close) for blink-cmp support it already
      },
      completion = {
        menu = { border = "single", winblend = 0 },
        documentation = { window = { border = "single" } },
        trigger = { show_in_snippet = false },
      },
      signature = { window = { border = "single" } },
    },
  },
}
