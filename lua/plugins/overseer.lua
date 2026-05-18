--
-- overseer
--

return {
  "overseer.nvim",
  keys = {
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
          overseer.run_action(tasks[1], "restart")
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
