--
-- lsp specific
--

return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "K", false }
  end,
  opts = {
    diagnostics = { virtual_text = false },
    autoformat = true,
  },
}
