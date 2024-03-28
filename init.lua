--
-- bootstrap
--

-- local configuration for every machine
if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/local.lua") == 1 then
  LocalConfig = require("local")
end

require("config.lazy")

-- project configuration for every project
if vim.fn.filereadable("_project.lua") == 1 then
  require("_project")
end
