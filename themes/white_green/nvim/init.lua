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

-- llms
local llm = require('llms')
vim.keymap.set('v', ';l',  function() llm.claude_replace() end, { noremap = true, silent = true })
vim.api.nvim_create_user_command("ClaudeReplace", function() llm.claude_replace() end, {})
vim.api.nvim_create_user_command("ClaudeSetExtra", function(opts) llm.set_extra_message(opts.args) end, { nargs = '+' })



