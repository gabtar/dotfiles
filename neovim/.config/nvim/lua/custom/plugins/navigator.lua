-- navigator.lua
-- Code analysis & navigation plugin for Neovim. Navigate codes like a breeze🎐 Exploring LSP and 🌲Treesitter symbols a piece of 🍰 Take control like a boss 🦍

return {
	'ray-x/navigator.lua',
	dependencies = {
		{ 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
		{ 'neovim/nvim-lspconfig' },
	},
}
