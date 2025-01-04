-- one_monokai.nvim
-- Nord for Neovim, but warmer and darker. Supports a variety of plugins and other platforms.
return {
	'AlexvZyl/nordic.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme 'nordic'
	end
}
