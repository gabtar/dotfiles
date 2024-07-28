-- oil.nvim
-- Neovim file explorer: edit your filesystem like a buffer
return {
	'stevearc/oil.nvim',
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			float = {
				padding = 10,
				win_options = {
					winblend = 10,
				},
			},
			view_options = {
				show_hidden = true,
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>oi", "<cmd>vsplit | wincmd l | vertical resize -60 | Oil<CR>",
			{ noremap = true, silent = true, desc = "Toggle [Oi]l floating window" })
	end
}
