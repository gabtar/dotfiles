-- kanagawa.nvim
-- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
return {
	'rebelot/kanagawa.nvim',
	priority = 1000,
	config = function()
		vim.cmd 'colorscheme kanagawa-wave'
	end,
}
