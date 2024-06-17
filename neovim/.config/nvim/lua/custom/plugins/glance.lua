-- glance.nvim
-- A pretty window for previewing, navigating and editing your LSP locations
return {
	"dnlhc/glance.nvim",
	config = function()
		require('glance').setup({
			-- your configuration
		})

		-- Keymaps
		vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
		vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
		vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
		vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')
	end,
}
