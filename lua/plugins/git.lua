--
-- git stuffs
--

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 500, -- ms
      ignore_whitespace = false,
      virt_text_priority = 9999,
    },
    current_line_blame_formatter = " ❯❯❯ [<author> <author_time>] - <summary> ",
  },
}
