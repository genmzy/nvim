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
        ["<Tab>"] = {
          "select_next",
          function(cmp)
            if has_words_before() then
              return cmp.show_and_insert()
            end
          end,
          "fallback",
        },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-l>"] = { "snippet_forward" },
        ["<C-o>"] = { "snippet_backward", "fallback" },
        -- c-j and c-k disable fallback
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        -- disable blink default c-p select prev, keep c-n select next
        ["<C-p>"] = {},
        ["<C-i>"] = {
          function(cmp)
            return has_words_before() and cmp.show_and_insert()
          end,
        },
        -- ignore c-w(close-and-fallback) and c-u(close-fallabck), c-e(close) for blink-cmp support it already
      },
      completion = {
        menu = { border = "rounded", winblend = 0 },
        documentation = { window = { border = "rounded" } },
        trigger = { show_in_snippet = false },
      },
      -- signature = { window = { border = "single" } },
    },
  },
}
