return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            null_ls.builtins.formatting.stylua, -- make sure to add it in :Mason
            null_ls.builtins.diagnostics.pylint
        })

        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end
}
