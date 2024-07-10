--
-- code complete
--

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  {
    "garymjr/nvim-snippets",
    -- disable all lazyvim luasnip keymaps for tab-insert and jump conflict
    keys = {
      { "<tab>", false, mode = { "i", "s" } },
      -- { "<tab>", false, mode = "s" },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<tab>", false, mode = "i" },
      { "<tab>", false, mode = "s" },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<c-l>"] = cmp.mapping(function()
          if not vim.snippet.active({ direction = 1 }) then
            return "<c-l>"
          end
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        end, { "i", "s" }),
        ["<c-o>"] = cmp.mapping(function()
          if not vim.snippet.active({ direction = -1 }) then
            return "<c-o>"
          end
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        end, { "i", "s" }),
        ["<c-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end),
        ["<c-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end),
        ["<tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<c-i>"] = cmp.mapping(function(fallback)
          if has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i" }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- delete stuff
        ["<c-w>"] = cmp.mapping(function(fallback)
          cmp.close()
          fallback()
        end),
        ["<c-u>"] = cmp.mapping(function(fallback)
          cmp.close()
          fallback()
        end),
        ["<c-e>"] = cmp.mapping.abort(),
      })
    end,
  },
}
