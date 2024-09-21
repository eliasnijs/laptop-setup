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
vim.keymap.set('v', ';l',  function() llm.claude_replace(llm.extra_message_code) end, { noremap = true, silent = true })
vim.keymap.set('v', ';L',  function() llm.claude_replace(llm.extra_message_text) end, { noremap = true, silent = true })
vim.api.nvim_create_user_command("ClaudeReplace", function() llm.claude_replace() end, {})
vim.api.nvim_create_user_command("ClaudeSetExtraCode", function(opts) llm.set_extra_message_code(opts.args) end, { nargs = '+' })
vim.api.nvim_create_user_command("ClaudeSetExtraText", function(opts) llm.set_extra_message_text(opts.args) end, { nargs = '+' })

-- link
local links = require('links')
vim.keymap.set('v', ';f', function() links.open_file_or_url() end, { noremap = true })

