--
-- bootstrap
--

-- local configuration for external configuration
if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/local.lua") == "1" then
  LocalConfig = require("local")
end

require("config.lazy")
