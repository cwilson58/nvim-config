return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
                null_ls.builtins.formatting.prettierd.with({ filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "scss", "css", "html", "vue" } }),
                null_ls.builtins.diagnostics.eslint_d,
            }
        })

        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end
}
