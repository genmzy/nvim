--
-- overseer
--

return {
  "overseer.nvim",
  keys = {
    { "<leader>os", "<cmd>OverseerShell<cr>", desc = "Task shell" },
  },
  opts = {
    component_aliases = { default = {
      "on_exit_set_status",
      "on_complete_notify",
    } },
  },
}
