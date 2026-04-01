--
-- snacks explorer
--

return {
  "snacks.nvim",
  keys = {
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undotree",
    },
  },
  opts = {
    scroll = { enabled = false },
    terminal = {
      win = {
        keys = {
          nav_h = false,
          nav_j = false,
          nav_k = false,
          nav_l = false,
        },
      },
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 30,
            },
          },
        },
      },
      win = {
        -- input window
        input = {
          keys = {
            ["<c-u>"] = { "<c-s-u>", mode = { "i" }, expr = true },
            ["<esc>"] = { "close", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<esc>"] = { "close", mode = { "i", "n" } },
          },
        },
      },
    },
    -- should run `check_health` for necessary tools
    -- for latex:   `apt install texlive-latex-extra`
    -- for mermaid: `echo 0 | sudo tee /proc/sys/kernel/apparmor_restrict_unprivileged_userns`
    image = {
      enabled = true,
      doc = { enabled = true, inline = true, float = false, max_width = 50, max_height = 50 },
    },
  },
}
