# WORK IN PROGRESS
:
# Todos
Main: (reason why we use this garbage in the first place)
Ascii calendar frontend for directory, where each file corresponds to a day.
I want to quickly toggle this frontend to jump between days and have multiple days side-by-side


- [ ] configure backup of undo history (to prevent loss of buffer content)
- [ ] Navigate Windows by ID instead of using hjkl
- [ ] enable creating new tab (aka new project) with own list of buffers
- [ ] bind :nmap <Leader>w :write<CR>:source<CR> for development
- [x] configure how buffers should be handled to prevent data loss (this will take half day probably lol)
-- `[x]` `<c-d>` quickfix: list all buffers and delete with a keystroke, warn when unwritten content would be lost
- [x] Bind Pycharm keys
:: Does not work under windows, see my_keymaps.PYCHARM_KEYS
- [x] SHIFT + ENTER keybinding
- [x] insert mode ALT +SHIFT + ] keybinding
- [x] CTRL + SHIFT + J in insert mode
- [x] overwrite pasting with :set paste `p` :set nopaste to keep formatting

# Useful help commands
:help c_CTRL-R (c is for command mode, CTRL-R paste into {register}) 
:help key_notation
:help buffers
:help registers


# LSP
`:LspInfo` shows currently running Language servers

# Neorg
% close all .norg buffers (and thereby return to last non-norg position)
`:Neorg return`

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

