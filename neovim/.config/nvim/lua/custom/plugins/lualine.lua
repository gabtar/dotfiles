-- lualine.nvim
-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
return {
	'nvim-lualine/lualine.nvim',
	-- See `:help lualine.txt`
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			globalstatus = true,
			theme = 'auto',
			component_separators = '|',
			section_separators = { left = ' ', right = ' ' },
		},
	},
}
