-- onedark.nvim
-- One dark and light colorscheme for neovim >= 0.5.0 written in lua based on Atom's One Dark and Light theme. Additionally, it comes with 5 color variant styles
return {
	'navarasu/onedark.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('onedark').setup {
			style = 'darker',
		}
		require('onedark').load()

		vim.cmd 'colorscheme onedark'
	end
}
