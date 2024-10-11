let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd C:/Program\ Files/Neovim/bin
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/calendar/index.norg
badd +123 ~/AppData/Local/nvim/lua/my_keymaps.lua
badd +1 ~/AppData/Local/nvim/lua/hellovertex.lua
badd +15 ~/AppData/Local/nvim/cheatsheet-nvim.md
badd +23 ~/AppData/Local/nvim/lua/plugins/calendar.lua
badd +72 ~/AppData/Local/nvim/lua/my_hooks.lua
badd +1 ~/AppData/Local/nvim/lua/my_telescope.lua
badd +24 ~/AppData/Local/nvim/lua/bootstrap_lazy.lua
badd +1 ~/AppData/Local/nvim/init.lua
badd +19 ~/AppData/Local/nvim/lua/my_options.lua
badd +1 ~/calendar/journal/2024/10/15.norg
badd +2 ~/AppData/Local/nvim/templates/norg/journal.norg
badd +18 ~/calendar/journal/2024/10/10.norg
badd +1 ~/calendar/journal/2024/10/11.norg
badd +1 ~/calendar/journal/2024/09/26.norg
badd +2 tmp.lua
badd +1 ~/calendar/journal/2024/10/13.norg
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/calendar/index.norg
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 97 + 97) / 194)
exe '2resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 96 + 97) / 194)
exe '3resize ' . ((&lines * 24 + 25) / 51)
argglobal
balt ~/calendar/journal/2024/10/10.norg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 33 - ((11 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 03|
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("~/calendar/journal/2024/10/11.norg", ":p")) | buffer ~/calendar/journal/2024/10/11.norg | else | edit ~/calendar/journal/2024/10/11.norg | endif
if &buftype ==# 'terminal'
  silent file ~/calendar/journal/2024/10/11.norg
endif
balt ~/calendar/index.norg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 6 - ((5 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 07|
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("~/AppData/Local/nvim/templates/norg/journal.norg", ":p")) | buffer ~/AppData/Local/nvim/templates/norg/journal.norg | else | edit ~/AppData/Local/nvim/templates/norg/journal.norg | endif
if &buftype ==# 'terminal'
  silent file ~/AppData/Local/nvim/templates/norg/journal.norg
endif
balt ~/calendar/index.norg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 09|
lcd C:/Program\ Files/Neovim/bin
wincmd w
exe '1resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 97 + 97) / 194)
exe '2resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 96 + 97) / 194)
exe '3resize ' . ((&lines * 24 + 25) / 51)
tabnext
edit ~/AppData/Local/nvim/lua/my_hooks.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 96 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 97 + 97) / 194)
argglobal
balt C:/Program\ Files/Neovim/bin/tmp.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 85 - ((35 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 85
normal! 033|
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("C:/Program\ Files/Neovim/bin/tmp.lua", ":p")) | buffer C:/Program\ Files/Neovim/bin/tmp.lua | else | edit C:/Program\ Files/Neovim/bin/tmp.lua | endif
if &buftype ==# 'terminal'
  silent file C:/Program\ Files/Neovim/bin/tmp.lua
endif
balt ~/calendar/journal/2024/10/13.norg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 025|
lcd C:/Program\ Files/Neovim/bin
wincmd w
exe 'vert 1resize ' . ((&columns * 96 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 97 + 97) / 194)
tabnext 2
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
