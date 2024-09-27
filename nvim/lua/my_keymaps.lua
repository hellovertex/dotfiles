-- Set up both the traditional leader (for keymaps) as well as the local leader (for norg files)
vim.g.mapleader = " " -- <SPACE>
vim.g.maplocalleader = ","

-- Map <Leader>d to open :Vex (netrw) in the current window
vim.keymap.set('n', '<Leader>d', ':Vex<CR>', { silent = true })

-- Define a function to copy the current directory in netrw to the clipboard
function CopyNetrwPathToClipboard()
  -- Get the current directory from netrw
  local path = vim.fn.expand('%:p:h')

  -- Use vim's API to copy to system clipboard
  vim.fn.setreg('+', path)
  -- Close the current buffer after copying
  vim.cmd('bwipeout')
  vim.notify('Copied: ' .. path)
end
vim.api.nvim_set_keymap('n', '<Leader>c', ':lua CopyNetrwPathToClipboard()<CR>', { noremap = true, silent = true })

-- Added default telescope shortcuts -- 2024-09-26 -- Specifically for Telescope buffers
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Remap Ctrl+V to paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true })

-- Remap Ctrl+Q to enter visual block mode
vim.api.nvim_set_keymap('n', '<C-q>', '<C-v>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-q>', '<C-v>', { noremap = true })

-- Remap :wqa to save session and then quit
vim.api.nvim_create_user_command('Wqa', function()
    vim.cmd("mksession! last-session.vim")
    -- todo: this will fail if a process is still running
    -- in this case, not exiting is correct, but pls print a specific err msg
    vim.cmd("wqa")
end, {})

-- Optionally, remap :wqa itself to :Wqa
vim.cmd [[
  cabbrev wqa Wqa
]]


