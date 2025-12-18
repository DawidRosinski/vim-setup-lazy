local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--g:alabaster_dim_comments
vim.g.alabaster_dim_comments = 1

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        -- We never want the following options
        vim.opt_local.formatoptions:remove({
            -- Auto-wrap text using 'textwidth'
            "t",
            -- Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
            "c",
            -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
            "o",
            -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
            "r",
        })
    end,
})

---- -- Add this to your ~/.config/nvim/init.lua or your plugin manager config
---- require("simple-plugin").setup({
----   enabled = true,
----   message = "My awesome Simple Plugin is loaded! ",
---- })

require("remap")
require("vim-options")
require("lazy").setup("plugins")

