-- Simple Neovim Lua Plugin with Telescope Integration
-- Save this file at:  ~/.config/nvim/lua/simple-plugin/init.lua

local M = {}

-- Plugin configuration
M.config = {
  enabled = true,
  message = "Hello from Simple Plugin! ",
  telescope_enabled = true,
}

-- Setup function to initialize the plugin
function M.setup(opts)
  -- Merge user options with defaults
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  if M.config.enabled then
    -- Set up keymaps
    M.setup_keymaps()

    -- Set up commands
    M. setup_commands()

    -- Set up autocommands if needed
    M. setup_autocommands()

    -- Set up telescope extension if enabled
    if M.config. telescope_enabled then
      M. setup_telescope()
    end
  end
end

-- Setup keymaps
function M.setup_keymaps()
  -- Example keymap:  <leader>sp to show plugin message
  vim.keymap.set(
    "n",
    "<leader>sp",
    function() M.show_message() end,
    { noremap = true, silent = true, desc = "Show Simple Plugin message" }
  )

  -- Keymap for telescope extension
  if M.config.telescope_enabled then
    vim.keymap.set(
      "n",
      "<leader>st",
      function() require("telescope").extensions.simple_plugin.simple_picker() end,
      { noremap = true, silent = true, desc = "Open Simple Plugin Telescope picker" }
    )
  end
end

-- Setup commands
function M.setup_commands()
  vim.api.nvim_create_user_command(
    "SimplePluginMessage",
    function()
      M.show_message()
    end,
    { desc = "Show Simple Plugin message" }
  )

  vim.api.nvim_create_user_command(
    "SimplePluginToggle",
    function()
      M.config.enabled = not M.config.enabled
      print("Simple Plugin is now " .. (M.config.enabled and "enabled" or "disabled"))
    end,
    { desc = "Toggle Simple Plugin" }
  )

  vim.api.nvim_create_user_command(
    "SimplePluginTelescope",
    function()
      require("telescope").extensions.simple_plugin.simple_picker()
    end,
    { desc = "Open Simple Plugin Telescope picker" }
  )
end

-- Setup autocommands
function M.setup_autocommands()
  local group = vim.api.nvim_create_augroup("SimplePluginGroup", { clear = true })

  -- Example: print message when entering a buffer
  vim. api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
      -- You can add logic here
            print("Entered buffer: " .. vim.fn.bufname("%"))
    end,
  })
end

-- Setup Telescope extension
function M.setup_telescope()
  local has_telescope, telescope = pcall(require, "telescope")
  if not has_telescope then
    vim.notify("Telescope is required for simple-plugin telescope integration", vim.log.levels. WARN)
    return
  end

  -- Register the extension
  telescope.load_extension("simple_plugin")
end

-- Show message function
function M.show_message()
  print(M.config.message)
end

-- Get plugin status
function M.is_enabled()
  return M.config.enabled
end

return M
