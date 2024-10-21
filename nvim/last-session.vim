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
badd +236 ~/AppData/Local/nvim/lua/my_keymaps.lua
badd +1 ~/AppData/Local/nvim/lua/hellovertex.lua
badd +76 ~/AppData/Local/nvim/cheatsheet-nvim.md
badd +83 ~/AppData/Local/nvim/lua/plugins/calendar.lua
badd +40 ~/AppData/Local/nvim/lua/my_hooks.lua
badd +1 ~/AppData/Local/nvim/lua/my_telescope.lua
badd +164 ~/AppData/Local/nvim/lua/bootstrap_lazy.lua
badd +1 ~/AppData/Local/nvim/init.lua
badd +19 ~/AppData/Local/nvim/lua/my_options.lua
badd +7 ~/calendar/journal/2024/10/15.norg
badd +2 ~/AppData/Local/nvim/templates/norg/journal.norg
badd +18 ~/calendar/journal/2024/10/10.norg
badd +10 ~/calendar/journal/2024/10/11.norg
badd +1 ~/calendar/journal/2024/09/26.norg
badd +22 tmp.lua
badd +10 ~/calendar/journal/2024/10/12.norg
badd +92 scratch
badd +10 ~/calendar/journal/2024/10/16.norg
badd +3 ~/calendar/journal/2024/10/13.norg
badd +2 ~/blender_tutorials/animations/index.norg
badd +3 ~/calendar/journal/2024/10/14.norg
badd +8 ~/calendar/journal/2024/10/17.norg
badd +13 ~/calendar/journal/2024/10/18.norg
badd +9 ~/calendar/journal/2024/11/05.norg
badd +4 ~/calendar/journal/2024/10/19.norg
badd +3 ~/calendar/journal/2024/10/20.norg
badd +17 ~/calendar/journal/2024/10/21.norg
badd +6 ~/calendar/journal/2024/10/22.norg
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
exe 'vert 1resize ' . ((&columns * 81 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 112 + 97) / 194)
argglobal
balt ~/calendar/journal/2024/10/21.norg
setlocal fdm=expr
setlocal fde=v:lua.vim.treesitter.foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
16
normal! zo
20
normal! zo
let s:l = 85 - ((23 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 85
normal! 08|
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("~/calendar/journal/2024/10/21.norg", ":p")) | buffer ~/calendar/journal/2024/10/21.norg | else | edit ~/calendar/journal/2024/10/21.norg | endif
if &buftype ==# 'terminal'
  silent file ~/calendar/journal/2024/10/21.norg
endif
balt ~/calendar/journal/2024/10/22.norg
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
let s:l = 15 - ((14 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 0
lcd C:/Program\ Files/Neovim/bin
wincmd w
exe 'vert 1resize ' . ((&columns * 81 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 112 + 97) / 194)
tabnext
edit ~/AppData/Local/nvim/lua/bootstrap_lazy.lua
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
exe 'vert 1resize ' . ((&columns * 109 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 84 + 97) / 194)
argglobal
balt ~/AppData/Local/nvim/lua/my_keymaps.lua
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
let s:l = 148 - ((23 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 148
normal! 04|
lcd C:/Program\ Files/Neovim/bin
wincmd w
argglobal
if bufexists(fnamemodify("C:/Program\ Files/Neovim/bin/tmp.lua", ":p")) | buffer C:/Program\ Files/Neovim/bin/tmp.lua | else | edit C:/Program\ Files/Neovim/bin/tmp.lua | endif
if &buftype ==# 'terminal'
  silent file C:/Program\ Files/Neovim/bin/tmp.lua
endif
balt ~/AppData/Local/nvim/lua/my_hooks.lua
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
let s:l = 14 - ((13 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 028|
lcd C:/Program\ Files/Neovim/bin
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 109 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 84 + 97) / 194)
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
