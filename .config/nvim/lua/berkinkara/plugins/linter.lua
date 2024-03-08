return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "pylint" },
        }

        local group = vim.api.nvim_create_augroup("berkinkara-linter", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = group,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
