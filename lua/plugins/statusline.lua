--
-- statusline
--

-- general modes
local alias = {
  n = "󰰓", -- normal
  i = "󰰄", -- insert
  c = "󰯲", -- command
  v = "󰰫", -- visual
  V = "󰰫 󰰍", -- visual line
  s = "󰰢", -- select
  S = "󰰢 󰰍", -- select line
  R = "󰰟", -- replace
  t = "󰰥", -- terminal
  [""] = "󰰫 󰯯", -- visual block
}

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
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
          return alias[vim.fn.mode()] or ""
        end,
        icon = "󰊠",
        separator = { left = "", right = "" },
        color = { gui = "bold" },
      },
    }
    opts.sections.lualine_b = {
      { "branch", icon = { "󰘬" } },
    }
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
