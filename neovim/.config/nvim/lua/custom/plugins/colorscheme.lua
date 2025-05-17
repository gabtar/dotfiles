-- nordic.nvim
-- One dark and light colorscheme for neovim >= 0.5.0 written in lua based on Atom's One Dark and Light theme. Additionally, it comes with 5 color variant styles
return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require('onedark').setup {
			style = 'dark'
		}
		-- Enable theme
		require('onedark').load()
	end
}
