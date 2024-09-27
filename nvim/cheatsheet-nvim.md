# WORK IN PROGRESS

# Todos
Main: (reason why we use this shiet in the first place)
Ascii calendar frontend for directory, where each file corresponds to a day.
I want to quickly toggle this frontend to ju:wmp between days and have multiple days side-by-side

`[ ]` Set up calendar frontend for journal
:: On starting neovim, decide between last-session.vim and calendear.ui (`<leader>s`, `<leader>j`)
:: when `<leader>j` was pressed, select a date or hit RET for current date
:: press `<leader>ni` to return to Neorg index
:: in Neorg index, you can preview all previous norg files using a custom picker on `<leader>np`
- [x] `<leader>j` to toggle calender view (journal)
- [x] `<leader>ni` to return to index
- [ ] On opening a norg file, add a link to it to the index.norg if it does not exist
- [ ] enable norg file preview in index file

`[x]` Set up Lua Development, so that we can program our calendar plugin
- [x] Set up AutoFormatting for Lua by mapping `:lua vim.lsp.buf.format()`
- [x] Bind CTRL+B to GoTo Defintion (via LSP)
- [x] Add Linter for Lua

`[ ]` QoL:
- [ ] Remap CTRL+W + '+' to '+'
- [ ] Remap CTRL+< to < (use this: https://vim.fandom.com/wiki/Fast_window_resizing_with_plus/minus_keys)
- [x] When entering netrw using `<leader>d`, do not create a split, instead use same buf
- [x] Re-Write changelog of dotfiles for the Neovim additions we made
- [ ] configure backup of undo history (to prevent loss of buffer content)
- [x] bind :nmap <Leader>w :write<CR>:source<CR> for development
- [x] configure how buffers should be handled to prevent data loss (this will take half day probably lol)
-- `[x]` `<c-d>` quickfix: list all buffers and delete with a keystroke, warn when unwritten content would be lost
- [x] Bind Pycharm keys
:: Does not work under windows, see my_keymaps.PYCHARM_KEYS
- [x] SHIFT + ENTER keybinding
- [x] insert mode ALT +SHIFT + ] keybinding
- [x] CTRL + SHIFT + J in insert mode
- [x] overwrite pasting with :set paste `p` :set nopaste to keep formatting

# Changelog of dotfiles
- CTRL+V                  -- lua/my_keymaps.lua    -- 2024-09-26
:: some sane system clipboard defaults for pasting
- SessionManager          -- lua/my_keymaps.lua    -- 2024-09-26
:: hitting :wqa triggers functions `DeleteAllTerminals` and `WriteAllBuffers` and creates `last-session.vim`
- <leader>d File-Explorer -- lua/my_keymaps.lua    -- 2024-09-27 
:: Opens filepath of current file in netrw
- <leader>c CpPath        -- lua/my_keymaps.lua    -- 2024-09-27 
:: Copies the filepath that netrw is currently in and closes netrw buffer going back to previous buf
- <leader>t Terminal      -- lua/my_keymaps.lua    -- 2024-09-27 
:: from within netrw, launch a terminal in current filepath in the same buffer

Notes: 
- Cant easily map multiple Keys, like <C-S-j> (Windows OS related?) 
- Getting weird ShaDa file overwrite errors on exit (Windows OS related?)

# Useful help commands
`:help vim.lsp.buf` -- to inspect all the language server bindings -- 2024-09-27
:help c_CTRL-R (c is for command mode, CTRL-R paste into {register}) 
:help key_notation
:help buffers
:help registers


# LSP
`:LspInfo` shows currently running Language servers
- lsp.vim.buf.hover()
- lsp.vim.buf.definition()


# Neorg
% close all .norg buffers (and thereby return to last non-norg position)
`:Neorg return`
`:Neorg toggle-concealer`
Link relative to workspace calendar {:$calendar/journal/2024/10/10.norg:}[2024-10-10]
- Insert date via <LocalLeader>id (,id)
- M-CR open selected item in vertical split
- `F` fixes incorrect link names (consider it like autocompletion)


# Multi line indent
TODO

# Buffers
:ls
:b n
:b p

# Split Windows
CTRL + v (vertically)
CTRL + s (horizontally)
CTRL + hjkl : navigate
CTRL + W + HJKL: full width/height
CTRL + < > : resize vertically
CTRL + -+: resize horizontally

# Block comments
CTRL + Q + Shift i + ESC + ESC

# Tip Special registers:
 0 - last yank
 " - unnamed register, last delete or yank
 % - current file name
 # - alternate file name
 * - clipboard contents (X11 primary)
 + - clipboard contents (X11 clipboard)
 / - last search pattern
 : - last command-line
 . - last inserted text
 - - last small (less than a line) delete
 = - expression register
 _ - black hole register

