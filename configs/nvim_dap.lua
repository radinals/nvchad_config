local dap, dapui,neodev = require("dap"), require("dapui"), require("neodev")

neodev.setup({
  library = {plugins = {"nvim-dap-ui"}, types=true},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.config = {
  render = {
    indent = 1,
    max_value_lines = 100
  }
}
