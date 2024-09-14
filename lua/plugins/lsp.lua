--
-- lsp specific
--

local cwd = function()
  return vim.fn.getcwd()
end

return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
    end,
    opts = {
      diagnostics = { virtual_text = false },
      root_dir = cwd,
      inlay_hints = { enabled = false },
      servers = {
        clangd = {
          root_dir = cwd,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
        lua_ls = { root_dir = cwd },
      },
    },
  },
}
