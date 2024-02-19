-- nvim-cmp
-- A completion plugin for neovim coded in Lua.
return {
	-- Autocompletion
	'hrsh7th/nvim-cmp',
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',

		-- Autocompletion sources
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp-signature-help',

		-- Adds a number of user-friendly snippets
		'rafamadriz/friendly-snippets',
	},
	config = function()
		-- [[ Configure nvim-cmp ]]
		-- See `:help cmp`
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		require('luasnip.loaders.from_vscode').lazy_load()
		luasnip.config.setup {}

		local kind_icons = {
			Class = "ﴯ",
			Color = "",
			Constant = "",
			Constructor = "",
			Enum = "",
			EnumMember = "",
			Event = "",
			Field = "",
			File = "",
			Folder = "",
			Function = "",
			Interface = "",
			Keyword = "",
			Method = "",
			Module = "",
			Operator = "",
			Property = "ﰠ",
			Reference = "",
			Snippet = "",
			Struct = "",
			Text = "",
			TypeParameter = "",
			Unit = "",
			Value = "",
			Variable = "",
		}

		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) --Concatonate the icons with name of the item-kind
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						spell = "[Spellings]",
						zsh = "[Zsh]",
						buffer = "[Buffer]",
						luasnip = "[Snip]",
						treesitter = "[Treesitter]",
						calc = "[Calculator]",
						nvim_lua = "[Lua]",
						path = "[Path]",
						nvim_lsp_signature_help = "[Signature]",
						cmdline = "[Vim Command]"
					})[entry.source.name]
					return vim_item
				end,
			},
			mapping = cmp.mapping.preset.insert {
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete {},
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				-- Iterate over autocomplete options with Tab
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
			},
			sources = {
				{ name = 'nvim_lsp',               keyword_length = 1 },
				{ name = 'luasnip',                keyword_length = 2 },
				{ name = 'buffer',                 keyword_length = 3 },
				{ name = 'path' },
				{ name = 'nvim_lsp_signature_help' },
			},
		}
	end,
}
