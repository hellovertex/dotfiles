vim.g.mapleader = " " -- <SPACE>
vim.g.maplocalleader = ","
local IS_WINDOWS = vim.loop.os_uname().sysname == "Windows_NT"
-- ###################
-- CALENDER && JOURNAL
-- ###################
vim.keymap.set('n', '<leader>j', ':Neorg journal custom<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ni', ':Neorg index<CR>', { noremap = true, silent = true })
function RunPickerForCalendar()
    local my_picker = require('plugins.calendar')
    my_picker.show_preview({})
end
vim.api.nvim_set_keymap('n', '<leader>np', ':lua RunPickerForCalendar()<CR>', { noremap = true, silent = true })

-- ###################
-- DEVELOPMENT KEYMAPS
-- ###################
vim.keymap.set('n', '<leader>w', ':write<CR>:source<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-CR>', '<C-o>o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-CR>', '<C-o>o', { noremap = true, silent = true })

-- ################
-- TERMINAL KEYMAPS
-- ################
-- Set keymap to trigger terminal in netrw
vim.api.nvim_create_autocmd("FileType", {
    -- dynamically create keymap when in netrw
    pattern = "netrw",
    callback = function()
        -- Define the keymap for <leader>t in netrw buffers
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>t', '', {
            noremap = true,
            silent = true,
            callback = function()
                -- Get the current directory in netrw
                local dir = vim.fn.expand('%:p:h')
                -- Convert the path to a fully expanded format
                local full_dir = vim.fn.fnamemodify(dir, ':p')
                -- kill current buffer, so that terminal will not be openend in new split
                --        vim.cmd('bwipeout')

                if IS_WINDOWS then
                    -- For Windows, use cmd
                    vim.cmd('terminal cd /d ' .. vim.fn.shellescape(full_dir) .. ' && cmd')
                else
                    -- For Unix-like systems, use $SHELL or bash
                    vim.cmd('terminal cd ' .. vim.fn.shellescape(full_dir) .. ' && $SHELL')
                end
            end,
        })
    end,
})

-- When in terminal mode under windows, make sure clicking ESC brings us to normal mode
if IS_WINDOWS then
    vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
end
-- ################
-- EXPLORER KEYMAPS
-- ################
vim.keymap.set('n', '<Leader>d', ':Ex<CR>', { silent = true })

-- Define a function to copy the current directory in netrw to the clipboard
function CopyNetrwPathToClipboard()
    -- Get the current directory from netrw
    local path = vim.fn.expand('%:p:h')
    -- Use vim's API to copy to system clipboard
    vim.fn.setreg('+', path)
    -- Close the current buffer after copying
    vim.cmd('bwipeout!')
    vim.notify('Copied: ' .. path)
end

vim.api.nvim_set_keymap('n', '<Leader>c', ':lua CopyNetrwPathToClipboard()<CR>', { noremap = true, silent = true })

-- ################
-- BUFFERS  KEYMAPS
-- ################
-- map <F2> :bprevious<CR>
-- map <F3> :bnext<CR>
vim.keymap.set('n', '<f2>', ':bprevious<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<F3>', ':bnext<CR>', { noremap = true, silent = true })

-- Added default telescope shortcuts -- 2024-09-26 -- Specifically for Telescope buffers
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.buffers, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- Upon exiting neovim, we can use this to not bother with errors on typing :wqa due to open terminals
function DeleteAllTerminalBuffers()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(bufnr, 'buftype') == 'terminal' then
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end
    end
end

function WriteAllBuffers()
    -- Get a list of all buffers
    local buffers = vim.api.nvim_list_bufs()

    -- Iterate over each buffer
    for _, buf in ipairs(buffers) do
        -- Check if the buffer is loaded, modifiable, and has no special 'buftype'
        if vim.api.nvim_buf_is_loaded(buf)
            and vim.api.nvim_buf_get_option(buf, "modifiable")
            and vim.api.nvim_buf_get_option(buf, "buftype") == "" then
            -- Check if the buffer has a file name
            local bufname = vim.api.nvim_buf_get_name(buf)
            if bufname == "" then
                -- Skip the buffer if it has no name
                print("Buffer has no name, skipping...")
            else
                -- Write the buffer
                vim.api.nvim_buf_call(buf, function() vim.cmd("write") end)
            end
        end
    end
end
vim.api.nvim_set_keymap('n', '<leader>b', ':lua WriteAllBuffers()<CR>', {noremap=true})
-- ##################
-- SESSION MANAGEMENT
-- ##################
-- Remap :wqa to save session and then quit
vim.api.nvim_create_user_command('Wqa', function()
    DeleteAllTerminalBuffers()
    WriteAllBuffers()
    vim.cmd("mksession! last-session.vim")
    vim.cmd("confirm wqa")
end, {})

-- Optionally, remap :wqa itself to :Wqa
vim.cmd [[
  cabbrev wqa Wqa
]]

vim.api.nvim_set_keymap('n', '<leader>s', ':source last-session.vim<CR>', { noremap = true, silent = true })

-- ################
-- DEFAULT KEYMAPS
-- ################
-- Remap Ctrl+V to paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true })

-- Remap Ctrl+Q to enter visual block mode
vim.api.nvim_set_keymap('n', '<C-q>', '<C-v>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-q>', '<C-v>', { noremap = true })


-- -- ################
-- -- PYCHARM KEYMAPS (FAILED)
-- -- ################
-- function DebugKey()
--     local key_sequence = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
--     print("Pressed keys: " .. key_sequence)
--     vim.api.nvim_feedkeys("O", "n", false)
-- --    vim.api.nvim_feedkeys("i", "n", false)
-- --    vim.api.nvim_feedkeys(key_sequence, 'n', false)
-- end
--
-- -- vim.api.nvim_set_keymap('i', '<S-CR>', 'lua: DebugKey()<CR>', { noremap = true, silent = true })
--
-- -- Map Shift+Enter in insert mode to insert a new line above
-- vim.keymap.set('n', '<S-CR>', function()
--     -- Exit insert mode
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
--     -- Insert a new line above and move the cursor to it
--     vim.api.nvim_feedkeys("O", "n", false)
--     -- Return to insert mode
--     vim.api.nvim_feedkeys("i", "n", false)
-- end, { silent = true })
