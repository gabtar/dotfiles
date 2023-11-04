-- OneDarkPro.nvim
-- Atom's iconic One Dark theme, for Neovim. Fully customisable, with Treesitter, LSP semantic token support and a light variant
return {
	'marko-cerovac/material.nvim',
	priority = 1000,
	config = function()
		vim.cmd 'colorscheme material-palenight'
	end,
}
