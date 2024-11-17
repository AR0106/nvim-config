-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.mouse = "a"

local dap = require("dap")

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

vim.keymap.set("n", "<Leader>t", function()
  vim.fn.feedkeys(":Template ")
end, { remap = true })

require("telescope").load_extension("find_template")

vim.wo.wrap = true

require("onedark").setup({
  style = "darker",
})
require("onedark").load()

-- Ensure toggleterm.nvim is installed and set up
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Function to open LazyGit in a floating terminal
local Terminal = require("toggleterm.terminal").Terminal

-- Define lazygit as a global variable
_G.lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "curved",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    -- Optional: close LazyGit with <q>
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  on_close = function(_)
    vim.cmd("startinsert!")
  end,
})

-- Define a general terminal popup
_G.generic_terminal = Terminal:new({
  cmd = nil, -- Defaults to your shell
  direction = "float",
  float_opts = {
    border = "curved",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    -- Optional: close terminal with <q>
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  on_close = function(_)
    vim.cmd("startinsert!")
  end,
})
-- Keybinding to toggle LazyGit
vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _G.lazygit:toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>tt",
  "<cmd>lua _G.generic_terminal:toggle()<CR>",
  { noremap = true, silent = true }
)
