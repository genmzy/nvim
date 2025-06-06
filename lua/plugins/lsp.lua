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
      diagnostics = { virtual_text = false, float = { border = "single" } },
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
            "--function-arg-placeholders=0",
            "--fallback-style=llvm",
          },
        },
        lua_ls = { root_dir = cwd },
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = false,
            },
          },
        },
        zls = {
          settings = {
            enable_argument_placeholders = false,
            enable_build_on_save = true,
            -- build_on_save_step = "check",
          },
        },
      },
    },
  },
}
