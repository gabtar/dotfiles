-- kanagawa.nvim
-- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
return {
	'cpea2506/one_monokai.nvim',
	priority = 1000,
	config = function()
		require("one_monokai").setup({
			transparent = false,
			colors = {},
			themes = function(colors)
				return {}
			end,
			italics = true,
		})
	end,
}
