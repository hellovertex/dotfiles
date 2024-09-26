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
    vim.cmd("wqa")
end, {})

-- Optionally, remap :wqa itself to :Wqa
vim.cmd [[
  cabbrev wqa Wqa
]]
