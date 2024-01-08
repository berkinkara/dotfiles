return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-latte")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },
}
