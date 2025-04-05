--
-- code complete
--

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-i>"] = {
          function(cmp)
            if has_words_before() then
              return cmp.show_and_insert()
            end
          end,
          "fallback",
        },
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
