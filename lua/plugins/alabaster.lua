

return {
    "p00f/alabaster.nvim",
    lazy = false,
    name = "alabaster",
    priority = 1000,
    enabled = true,
    config = function() -- defual implementation will run automatically required(MAIN).setup(opts)
        vim.cmd.colorscheme("alabaster")
    end
}
