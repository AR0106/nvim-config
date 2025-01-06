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

dap.configurations.zig = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Program", vim.fn.getcwd() .. "/zig-out/bin/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

require("telescope").load_extension("find_template")

vim.wo.wrap = true

require("catppuccin").setup({
  background = { -- :h background
    light = "latte",
    dark = "frappe",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {
    frappe = {
      rosewater = "#f5e0dc",
      flamingo = "#f2cdcd",
      pink = "#4f6bb8",
      mauve = "#cb81e6",
      red = "#be6046",
      maroon = "#e06c75",
      peach = "#d19a66",
      yellow = "#ecbe67",
      green = "#9ee06a",
      teal = "#65bbad",
      sky = "#89dceb",
      sapphire = "#56b6c2",
      blue = "#61afef",
      lavender = "#b4befe",
      text = "#93b2ed",
      subtext1 = "#bac2de",
      subtext0 = "#a6adc8",
      overlay2 = "#9399b2",
      overlay1 = "#7f849c",
      overlay0 = "#5c6370",
      surface2 = "#585b70",
      surface1 = "#45475a",
      surface0 = "#303143",
      base = "#1d2026",
      mantle = "#21252c",
      crust = "#11111b",
    },
    macchiato = {
      rosewater = "#F5B8AB",
      flamingo = "#F29D9D",
      pink = "#AD6FF7",
      mauve = "#FF8F40",
      red = "#E66767",
      maroon = "#EB788B",
      peach = "#FAB770",
      yellow = "#FACA64",
      green = "#70CF67",
      teal = "#4CD4BD",
      sky = "#61BDFF",
      sapphire = "#4BA8FA",
      blue = "#00BFFF",
      lavender = "#00BBCC",
      text = "#C1C9E6",
      subtext1 = "#A3AAC2",
      subtext0 = "#8E94AB",
      overlay2 = "#7D8296",
      overlay1 = "#676B80",
      overlay0 = "#464957",
      surface2 = "#3A3D4A",
      surface1 = "#2F313D",
      surface0 = "#1D1E29",
      base = "#0b0b12",
      mantle = "#11111a",
      crust = "#191926",
    },
  },
  custom_highlights = function(C)
    return {
      CurSearch = { bg = C.sky },
      IncSearch = { bg = C.sky },
      CursorLineNr = { fg = C.blue, style = { "bold" } },
      DashboardFooter = { fg = C.overlay0 },
      TreesitterContextBottom = { style = {} },
      WinSeparator = { fg = C.overlay0, style = { "bold" } },
      ["@markup.italic"] = { fg = C.blue, style = { "italic" } },
      ["@markup.strong"] = { fg = C.blue, style = { "bold" } },
      Headline = { style = { "bold" } },
      Headline1 = { fg = C.blue, style = { "bold" } },
      Headline2 = { fg = C.pink, style = { "bold" } },
      Headline3 = { fg = C.lavender, style = { "bold" } },
      Headline4 = { fg = C.green, style = { "bold" } },
      Headline5 = { fg = C.peach, style = { "bold" } },
      Headline6 = { fg = C.flamingo, style = { "bold" } },
      rainbow1 = { fg = C.blue, style = { "bold" } },
      rainbow2 = { fg = C.pink, style = { "bold" } },
      rainbow3 = { fg = C.lavender, style = { "bold" } },
      rainbow4 = { fg = C.green, style = { "bold" } },
      rainbow5 = { fg = C.peach, style = { "bold" } },
      rainbow6 = { fg = C.flamingo, style = { "bold" } },
      CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
      CmpItemKindKeyword = { fg = C.base, bg = C.red },
      CmpItemKindText = { fg = C.base, bg = C.teal },
      CmpItemKindMethod = { fg = C.base, bg = C.blue },
      CmpItemKindConstructor = { fg = C.base, bg = C.blue },
      CmpItemKindFunction = { fg = C.base, bg = C.blue },
      CmpItemKindFolder = { fg = C.base, bg = C.blue },
      CmpItemKindModule = { fg = C.base, bg = C.blue },
      CmpItemKindConstant = { fg = C.base, bg = C.peach },
      CmpItemKindField = { fg = C.base, bg = C.green },
      CmpItemKindProperty = { fg = C.base, bg = C.green },
      CmpItemKindEnum = { fg = C.base, bg = C.green },
      CmpItemKindUnit = { fg = C.base, bg = C.green },
      CmpItemKindClass = { fg = C.base, bg = C.yellow },
      CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
      CmpItemKindFile = { fg = C.base, bg = C.blue },
      CmpItemKindInterface = { fg = C.base, bg = C.yellow },
      CmpItemKindColor = { fg = C.base, bg = C.red },
      CmpItemKindReference = { fg = C.base, bg = C.red },
      CmpItemKindEnumMember = { fg = C.base, bg = C.red },
      CmpItemKindStruct = { fg = C.base, bg = C.blue },
      CmpItemKindValue = { fg = C.base, bg = C.peach },
      CmpItemKindEvent = { fg = C.base, bg = C.blue },
      CmpItemKindOperator = { fg = C.base, bg = C.blue },
      CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
      CmpItemKindCopilot = { fg = C.base, bg = C.teal },
    }
  end,
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    dropbar = {
      enabled = true,
      color_mode = true,
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd("colorscheme catppuccin-frappe")

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
-- require("onedark").setup({
--   style = "darker",
-- })
-- require("onedark").load()

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
