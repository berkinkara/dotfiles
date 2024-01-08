return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local telescope_builtin = require("telescope.builtin")

        vim.keymap.set('n', 'dk', vim.diagnostic.goto_prev, { desc = 'Goto previous diagnostic message' })
        vim.keymap.set('n', 'dj', vim.diagnostic.goto_next, { desc = 'Goto next diagnostic message' })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("gd", telescope_builtin.lsp_definitions, "Goto definition")
            nmap("gD", vim.lsp.buf.declaration, "Goto decleration")
            nmap("gt", telescope_builtin.lsp_type_definitions, "Goto type definition")
            nmap("gi", telescope_builtin.lsp_implementations, "Goto implementation")
            nmap("gr", telescope_builtin.lsp_references, "Goto references")
            nmap("<leader>ds", telescope_builtin.lsp_document_symbols, "Document symbols")
            nmap("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "Workspace symbols")
            nmap("K", vim.lsp.buf.hover, "Hover documentation")
            nmap("<C-k>", vim.lsp.buf.signature_help, "Signature documentation")
            nmap("rn", vim.lsp.buf.rename, "Rename")
            nmap("<leader>ca", vim.lsp.buf.code_action, "Code actions")
            nmap("<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, "Format")
            nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace add folder")
            nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace remove folder")
            nmap("<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, "Workspace list folders")
        end

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    format = { enable = false },
                },
            },
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
}
