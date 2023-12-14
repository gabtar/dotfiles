-- Fterm.nvim
-- No-nonsense floating terminal plugin for neovim
return {
	'numToStr/FTerm.nvim',
	config = function()
		require 'FTerm'.setup({
			border     = 'shadow', -- Other options :h nvim_open_win
			dimensions = {
				height = 0.4,
				width = 1.0,
				x = 0.0, -- X axis of the terminal window
				y = 1.0, -- Y axis of the terminal window
			},
			hl         = 'ColorColumn',
			blend      = 20,
		})

		-- Example keybindings
		vim.keymap.set('n', '<leader>tm', '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set('t', '<leader>tm', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
