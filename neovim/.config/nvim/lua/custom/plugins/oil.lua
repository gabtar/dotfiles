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
		})
		vim.api.nvim_set_keymap("n", "<leader>oi", "<cmd>lua require('oil').toggle_float('.')<CR>",
			{ noremap = true, silent = true, desc = "Toggle [Oi]l floating window" })
	end
}
