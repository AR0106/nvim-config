return {
    "f-person/auto-dark-mode.nvim",
    opts = {
        update_interval = 1000,
        set_dark_mode = function()
            vim.o.background = "dark"
            vim.cmd("colorscheme catppuccin-frappe")
        end,
        set_light_mode = function()
            vim.o.background = "light"
            vim.cmd("colorscheme catppuccin-latte")
        end,
    },
}