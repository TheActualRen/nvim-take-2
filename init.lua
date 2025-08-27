vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.wrap = true
vim.o.swapfile = false

vim.g.mapleader = " "

require("config.lazy")

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- from the official repo 
require("tiny-inline-diagnostic").setup({
    signs = {
        left = "",       -- Left border character
        right = "",      -- Right border character
        diag = "●",       -- Diagnostic indicator character
        arrow = "    ",   -- Arrow pointing to diagnostic
        up_arrow = "    ", -- Upward arrow for multiline
        vertical = " │",   -- Vertical line for multiline
        vertical_end = " └", -- End of vertical line for multiline
    },
    blend = {
        factor = 0.22,    -- Transparency factor (0.0 = transparent, 1.0 = opaque)
    },
})
