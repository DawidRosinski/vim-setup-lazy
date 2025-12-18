return {
    {
        "github/copilot.vim",
        -- disable copilot by default
        lazy = false, -- true if you want to lazy loading

        -- key = { "<leader>ce" },
        config = function ()

            vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
            })
            vim.g.copilot_no_tab_map = true
            -- vim.keymap.set("n", "<learder>cd", ":Copilot disable <CR>", {})
            -- vim.keymap.set("n", "<learder>ce", ":Copilot enable <CR>", {})
            
        end
    }
}
