-- general modes
local alias = {
  n = "N", -- normal
  i = "I", -- insert
  c = "C", -- command
  v = "V", -- visual
  V = "VL", -- visual line
  s = "S", -- select
  R = "R", -- replace
  t = "T", -- terminal
  [""] = "VB", -- visual block
}

local gb = require("statusline.gruvbox")

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = gb
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
      { "branch", icon = { "󰀘" } },
    }
    table.insert(opts.sections.lualine_c, 1, {
      function()
        if vim.bo.modified and not require("util.colors").is_lazy_color() then
          return "󰷥"
        end
        return ""
      end,
      color = { fg = Snacks.util.color("Special") },
    })
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
