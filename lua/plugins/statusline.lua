--
-- statusline
--

-- general modes
local alias = {
  n = "󰰓", -- normal
  i = "󰰄", -- insert
  c = "󰯲", -- command
  v = "󰰫", -- visual
  V = "󰰍", -- visual line
  s = "󰰢", -- select
  R = "󰰟", -- replace
  t = "󰰥", -- terminal
  [""] = "󰯯", -- visual block
}

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = "auto"
    opts.options.component_separators = {
      left = "",
      right = "",
    }
    opts.options.section_separators = {
      left = "",
      right = "",
    }
    opts.sections.lualine_a = {
      {
        function()
          return alias[vim.fn.mode()] or "?"
        end,
        icon = "󰊠",
        separator = { left = "", right = "" },
        color = { gui = "bold" },
      },
    }
    opts.sections.lualine_b = {
      { "branch", icon = { "󰘬" } },
    }
    if not require("util.colors").is_lazy_color() then
      table.insert(opts.sections.lualine_c, 1, {
        function()
          return vim.bo.modified and "󰷥" or ""
        end,
        color = { fg = Snacks.util.color("Special") },
      })
    end
    opts.sections.lualine_z = {
      {
        function()
          return " " .. os.date("%R")
        end,
        separator = { left = "", right = "" },
        color = { gui = "bold" },
      },
    }
  end,
}
