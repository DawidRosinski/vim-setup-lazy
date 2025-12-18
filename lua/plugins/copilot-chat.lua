return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
        { "github/copilot.vim" },
    },
    build = "make tiktoken",
    opts = {
        model = "gpt-4.1",
        temperature = 0.1,
        -- window = {
        --     
        -- },
        separators = '___',
        auto_fold = true,
        -- mappings = {
        --     complete {
        --         insert = "<C-Space>",
        --     },
        -- },
    },
}
