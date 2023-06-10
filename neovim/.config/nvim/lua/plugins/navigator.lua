-- Navigator
-- Code analysis & navigation plugin for Neovim. Navigate codes like a breezewind_chime Exploring LSP and evergreen_treeTreesitter symbols a piece of cake Take control like a boss gorilla
return {
    'ray-x/navigator.lua',
    dependencies = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
    config = function()
      require('navigator').setup()
    end,
}
