local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<S-tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-x>', '<Cmd>BufferClose<CR>', opts)

require('barbar').setup{
	sidebar_filetypes = {
		NvimTree = true,
	},
}
