--
-- lsp specific
--

local cwd = function()
  return vim.fn.getcwd()
end

-- mason general --
local mason_dir = vim.fn.stdpath("data") .. "/mason"
local mason_packages_dir = mason_dir .. "/packages"

-- java --
local jdtls_dir = mason_packages_dir .. "/jdtls"
local lombok_path = jdtls_dir .. "/lombok.jar"

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
      servers = {
        clangd = { root_dir = cwd },
        jdtls = { root_dir = cwd },
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      root_dir = cwd,
      cmd = {
        jdtls_dir .. "/jdtls",
        "--jvm-arg=-javaagent:" .. lombok_path,
        "--jvm-arg=-Xbootclasspath/a:" .. lombok_path,
      },
      jdtls = {
        settings = {
          java = {
            configuration = {
              -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
              -- And search for `interface RuntimeOption`
              -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
              runtimes = LocalConfig and LocalConfig.jdtls_runtimes or {},
            },
          },
        },
      },
    },
  },
}
