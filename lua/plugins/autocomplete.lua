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
      sources = {
        providers = {
          snippets = {
            -- if has a letter(non-whitespace) before current cursor,
            -- low down snippet priority
            score_offset = function()
              return has_words_before() and -10 or 0
            end,
          },
        },
      },
      keymap = {
        preset = "enter",
        -- perhaps should use more c-l instead of tab and enter
        ["<c-o>"] = { "snippet_backward" },
        -- c-j and c-k disable fallback
        ["<c-j>"] = { "select_next", "fallback" },
        ["<c-k>"] = { "select_prev" },
        -- disable blink default c-p select prev, keep c-n select next
        ["<c-p>"] = {},
        ["<c-l>"] = {
          "snippet_forward",
          function(cmp)
            return has_words_before() and cmp.show_and_insert()
          end,
        },
        ["<Tab>"] = { -- NOTE: it seems a bug if use <tab> instead of <Tab>
          function(cmp)
            return has_words_before() and cmp.show_and_insert() or false
          end,
          "select_next",
          "fallback",
        },
        ["<s-tab>"] = { "select_prev", "fallback" },
        -- ignore c-w(close-and-fallback) and c-u(close-fallabck), c-e(close) for blink-cmp support it already
      },
      completion = {
        menu = { border = "rounded", winblend = 0 },
        documentation = { window = { border = "rounded" } },
        trigger = { show_in_snippet = true },
        ghost_text = {
          enabled = function()
            return vim.bo.filetype ~= "opencode_ask"
          end,
        },
      },
      -- signature = { window = { border = "single" } },
    },
  },
}
