return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "ts_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    -- Disable the LSP's formatting capabilities
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set({ "n", "v" }, "<leader>fw", function()
                vim.notify("formating and write");
                vim.lsp.buf.format()
                vim.cmd('w')
            end, {})
        end,
    },
}
