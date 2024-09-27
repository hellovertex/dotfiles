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
badd +1 ~/AppData/Local/nvim/lua/hellovertex.lua
badd +1 ~/calendar/journal/2024/09/26.norg
badd +1 ~/AppData/Local/nvim/init.lua
badd +1 health://
badd +77 ~/AppData/Local/nvim/lua/plugins/hellovertex.lua
badd +46 ~/AppData/Local/nvim/lua/bootstrap_lazy.lua
badd +1 ~/Documents/Neovim/cheatsheet-nvim.md
badd +16 ~/AppData/Local/nvim/lua/my_keymaps.lua
badd +1 ~/AppData/Local/nvim/lua/my_hooks.lua
badd +35 ~/AppData/Local/nvim/lua/plugins/calendar.lua
badd +2 ~/AppData/Local/nvim/lua/my_options.lua
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/AppData/Local/nvim/init.lua
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
exe 'vert 1resize ' . ((&columns * 115 + 115) / 230)
exe 'vert 2resize ' . ((&columns * 114 + 115) / 230)
argglobal
balt ~/AppData/Local/nvim/lua/hellovertex.lua
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
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("~/AppData/Local/nvim/lua/hellovertex.lua", ":p")) | buffer ~/AppData/Local/nvim/lua/hellovertex.lua | else | edit ~/AppData/Local/nvim/lua/hellovertex.lua | endif
if &buftype ==# 'terminal'
  silent file ~/AppData/Local/nvim/lua/hellovertex.lua
endif
balt ~/AppData/Local/nvim/init.lua
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
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd C:/Program\ Files/Neovim/bin
wincmd w
exe 'vert 1resize ' . ((&columns * 115 + 115) / 230)
exe 'vert 2resize ' . ((&columns * 114 + 115) / 230)
tabnext
edit ~/Documents/Neovim/cheatsheet-nvim.md
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
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
exe '1resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 1resize ' . ((&columns * 114 + 115) / 230)
exe '2resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 2resize ' . ((&columns * 114 + 115) / 230)
exe '3resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 3resize ' . ((&columns * 115 + 115) / 230)
exe '4resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 4resize ' . ((&columns * 115 + 115) / 230)
argglobal
balt ~/AppData/Local/nvim/lua/plugins/calendar.lua
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
let s:l = 47 - ((12 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 47
normal! 0
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("~/AppData/Local/nvim/lua/my_keymaps.lua", ":p")) | buffer ~/AppData/Local/nvim/lua/my_keymaps.lua | else | edit ~/AppData/Local/nvim/lua/my_keymaps.lua | endif
if &buftype ==# 'terminal'
  silent file ~/AppData/Local/nvim/lua/my_keymaps.lua
endif
balt ~/Documents/Neovim/cheatsheet-nvim.md
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
let s:l = 1 - ((0 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 067|
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("~/AppData/Local/nvim/lua/bootstrap_lazy.lua", ":p")) | buffer ~/AppData/Local/nvim/lua/bootstrap_lazy.lua | else | edit ~/AppData/Local/nvim/lua/bootstrap_lazy.lua | endif
if &buftype ==# 'terminal'
  silent file ~/AppData/Local/nvim/lua/bootstrap_lazy.lua
endif
balt ~/Documents/Neovim/cheatsheet-nvim.md
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
let s:l = 46 - ((14 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 46
normal! 086|
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("~/AppData/Local/nvim/lua/bootstrap_lazy.lua", ":p")) | buffer ~/AppData/Local/nvim/lua/bootstrap_lazy.lua | else | edit ~/AppData/Local/nvim/lua/bootstrap_lazy.lua | endif
if &buftype ==# 'terminal'
  silent file ~/AppData/Local/nvim/lua/bootstrap_lazy.lua
endif
balt ~/Documents/Neovim/cheatsheet-nvim.md
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
let s:l = 46 - ((14 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 46
normal! 086|
lcd C:/Program\ Files/Neovim/bin
wincmd w
exe '1resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 1resize ' . ((&columns * 114 + 115) / 230)
exe '2resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 2resize ' . ((&columns * 114 + 115) / 230)
exe '3resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 3resize ' . ((&columns * 115 + 115) / 230)
exe '4resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 4resize ' . ((&columns * 115 + 115) / 230)
tabnext
edit ~/AppData/Local/nvim/lua/bootstrap_lazy.lua
argglobal
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
let s:l = 71 - ((56 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 71
normal! 062|
lcd ~/AppData/Local/nvim/lua
tabnext 3
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
