# Todos
- Navigate Windows by ID instead of using hjkl
- Fix CTRL<->CAPS remap not working in Windows
::Restarting AHK script in admin mode worked!


# Changelog of dotfiles
- CTRL+V                 -- lua/my_keymaps.lua    -- 2024-09-26
- SessionManager         -- lua/my_hooks.lua      -- 2024-09-26



# Neorg
% close all .norg buffers (and thereby return to last non-norg position)
`Neorg: return`


# KEYMAPS
:help c_CTRL-R (c is for command mode, can be n,v,o,etc.)
CTRL-R {register} inserts content of named or numbered register


# Multi line indent
Use the > command. To indent five lines, 5>>. To mark a block of lines and indent it, Vjj> to indent three lines (Vim only). To indent a curly-braces block, put your cursor on one of the curly braces and use >% or from anywhere inside block use >iB.

If you’re copying blocks of text around and need to align the indent of a block in its new location, use ]p instead of just p. This aligns the pasted block with the surrounding text.

Also, the shiftwidth setting allows you to control how many spaces to indent.

I use >i} (indent inner {} block). Works in vim. Not sure it works in vi.

# Window with other file
: split /path/to/file

# Terminal
:terminal
# Buffers
:ls
:b n
:b p


# Misc
Show lua runtime path directories
:lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))

Paste in command mode
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

