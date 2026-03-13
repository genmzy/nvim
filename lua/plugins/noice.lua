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
    cmdline = single,
    -- messages = single,
    views = {
      popup = { border = { style = "single" } },
    },
  },
}
