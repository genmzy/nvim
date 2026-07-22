--
-- overseer
--

return {
  "overseer.nvim",
  keys = {
    -- difference from lazyvim: make cursor to jump to overseer list window
    { "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "Task list" },
    { "<leader>os", "<cmd>OverseerShell<cr>", desc = "Task shell" },
    {
      "<leader>or",
      function()
        local overseer = require("overseer")
        local tasks = overseer.list_tasks({
          -- new to former
          sort = function(a, b)
            return a.time_start > b.time_start
          end,
        })
        if #tasks > 0 then
          local task = tasks[1]
          vim.notify("Re-running last task: `" .. task.name .. "`")
          overseer.run_action(task, "restart")
        else
          vim.notify("No existing overseer tasks")
        end
      end,
      desc = "Restart last task",
    },
  },
  opts = {
    component_aliases = { default = {
      "on_exit_set_status",
      "on_complete_notify",
    } },
  },
}
