-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.mouse = "a"

local dap = require("dap")
local project = require("project_nvim")

dap.adapters.coreclr = {
  type = "executable",
  command = "/usr/local/bin/netcoredbg/netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
  },
}
