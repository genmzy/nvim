--
-- noice
--

local single = { opts = { border = "single" } }

return {
  "folke/noice.nvim",

  opts = {
    presets = {
      lsp_doc_border = {
        views = {
          hover = {
            border = {
              style = "single",
            },
          },
        },
      },
    },
    inc_rename = false,
    cmdline = single,
    -- messages = single,
    views = {
      popup = { border = { style = "single" } },
    },
  },
}
