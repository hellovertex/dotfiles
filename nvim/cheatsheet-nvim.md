# Todos
- configure backup of undo history (to prevent loss of buffer content)
- enable creating new tab (aka new project) with own list of buffers
- configure how buffers should be handled to prevent data loss (this will take half day probably lol)
-- quickfix: list all buffers and delete with a keystroke, warn when unwritten content would be lost
- Navigate Windows by ID instead of using hjkl
- todo: bind :nmap <Leader>w :write<CR>:source<CR> for development
- SHIFT + ENTER keybinding
- insert mode ALT +SHIFT + ] keybinding
- overwrite pasting with :set paste `p` :set nopaste to keep formatting


# Neorg
% close all .norg buffers (and thereby return to last non-norg position)
`:Neorg return`


# KEYMAPS
:help c_CTRL-R (c is for command mode, CTRL-R paste into {register}) 

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

