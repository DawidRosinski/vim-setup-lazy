
return { 
    "catppuccin/nvim", 
    lazy = false, 
    name = "catppuccin", 
    priority = 1000,
    config = function() -- defual implementation will run automatically required(MAIN).setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end
}
