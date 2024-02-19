-- onenord.nvim
--  Neovim theme that combines the Nord and Atom One Dark color palettes for a more vibrant programming experience.
return {
	'rmehri01/onenord.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd 'colorscheme onenord'
	end
}
