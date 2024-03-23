-- neotest
-- An extensible framework for interacting with tests within NeoVim.
return {
	-- A framework for interacting with tests within NeoVim.
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		-- Vim test for 'generic adapter'
		"vim-test/vim-test",
		-- Adapters
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
		"haydenmeade/neotest-jest",
		"nvim-neotest/neotest-vim-test", -- Supports all languages that vim test support
	},
	config = function()
		local neotest = require("neotest")
		local options = { noremap = true, silent = true, nowait = true }
		local keymap = vim.keymap.set

		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		require("neotest").setup({
			quickfix = {
				open = false,
				enabled = false,
			},
			status = {
				enabled = true,
				signs = true, -- Sign after function signature
				virtual_text = false
			},
			icons = {
				child_indent = "│",
				child_prefix = "├",
				collapsed = "─",
				expanded = "╮",
				failed = "✘",
				final_child_indent = " ",
				final_child_prefix = "╰",
				non_collapsible = "─",
				passed = "✓",
				running = "",
				running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
				skipped = "↓",
				unknown = ""
			},
			floating = {
				border = "rounded",
				max_height = 0.9,
				max_width = 0.9,
				options = {}
			},
			summary = {
				animated = true,
				enabled = true,
				expand_errors = true,
				follow = true,
				mappings = {
					attach = "a",
					clear_marked = "M",
					clear_target = "T",
					debug = "d",
					debug_marked = "D",
					expand = { "<CR>", "<2-LeftMouse>" },
					expand_all = "e",
					jumpto = "i",
					mark = "m",
					next_failed = "J",
					output = "o",
					prev_failed = "K",
					run = "r",
					run_marked = "R",
					short = "O",
					stop = "u",
					target = "t",
					watch = "w"
				},
				open = "botright vsplit | vertical resize 40"
			},
			adapters = {
				require("neotest-vim-test")({
					ignore_file_types = { "python" },
				}),
				require("neotest-go"),
				require("neotest-python"),
				require('neotest-jest')({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			}
		})

		-- Keymaps
		-- Launch all tests (test full run)
		keymap(
			"n",
			"<localleader>tfr",
			function()
				neotest.run.run(vim.fn.expand("%"))
				neotest.summary.open()
			end,
			options
		)

		-- Launch nearest
		keymap(
			"n",
			"<localleader>tr",
			function()
				neotest.run.run()
				neotest.summary.open()
			end,
			options
		)

		-- Open test output window
		keymap(
			"n",
			"<localleader>to",
			function()
				neotest.output.open({ last_run = true, enter = true })
			end
		)

		-- Toogle test summary panel
		keymap(
			"n",
			"<localleader>tt",
			function()
				neotest.summary.toggle()
			end,
			options
		)
	end

}
