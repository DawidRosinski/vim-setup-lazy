return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = {
						justMyCode = false,
						console = "integratedTerminal",
					},
					-- args = { "--log-level", "DEBUG", "--quiet" },
					runner = "pytest",
					python = "hils/venv/Scripts/python.exe",
				}),
				-- require("neotest-plenary"),
				-- require("neotest-vim-test")({
				--     ignore_file_types = { "python", "vim", "lua" },
				-- }),
			},
		})

		--        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
		--        lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
		--        lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
		--        lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
		--        lvim.builtin.which_key.mappings["dF"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
		--        lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

		vim.keymap.set("n", "<Leader>dm", function()
			require("neotest").run.run()
		end)

		vim.keymap.set("n", "<Leader>dM", function()
			require("neotest").run.run({ strategy = "dap" })
		end)

		vim.keymap.set("n", "<Leader>dS", function()
			require("neotest").summary.toggle()
		end)

		vim.keymap.set("n", "<Leader>do", function()
			require("neotest").output_panel.toggle()
		end)
	end,
}
