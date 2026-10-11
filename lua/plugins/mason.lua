return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = { "lua_ls", "clangd", "ts_ls", "csharp_ls" },
            automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = { "lua_ls", "clangd", "ts_ls", "csharp_ls" }

            for _, server in ipairs(servers) do
                local opts = { capabilities = capabilities }
                if server == "ts_ls" then
                    opts.on_attach = function(client, bufnr)
                        -- Disable the LSP's formatting capabilities
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                    end
                end
                vim.lsp.config[server] = opts
            end
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set({ "n", "v" }, "<leader>fw", function()
                vim.notify("formating and write")
                vim.lsp.buf.format()
                vim.cmd("w")
            end, {})
        end,
    },
}
