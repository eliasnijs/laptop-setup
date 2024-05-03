require('plugins')

-- comma as leader
vim.g.mapleader = ","

-- load legacy options
vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

-- lualine
require('lualine').setup()

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
}

-- colorizer
require('colorizer').setup()

-- autopairs
require('nvim-autopairs').setup {}
