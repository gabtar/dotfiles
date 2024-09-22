-- drex.nvim
-- Another directory/file explorer for Neovim written in Lua
return {
	'theblob42/drex.nvim',
	dependencies = 'kyazdani42/nvim-web-devicons', -- optional
	config = function()
		vim.keymap.set('n', '<leader>\\', '<CMD>DrexDrawerToggle<CR>', { desc = '[\\] Toggle Drex' })
	end
}
