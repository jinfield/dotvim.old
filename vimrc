filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
syntax enable

" Set defaults [:h Q_op for abbrs]
set nocompatible
set ai et sw=2 ts=2 sts=2         " auto indent, 2 space tabs
set ch=2 so=3 ls=2                " commandline, scrolloff, laststatus
set dir=/var/tmp,/tmp             " dir for swapfile
set nofoldenable                  " turn off folding
set splitbelow splitright         " new window placement
set list listchars=tab:»·,trail:·
set statusline=%<%f\ %h%m%r\ %y\ %{fugitive#statusline()}%=%-16(\ %l,%c-%v\ %)%P

" Enable 256 color xterm support
au VimEnter * if &term == 'xterm' | set t_Co=256 | endif

colorscheme wombat256mod

function! GeomToggle()
  if (has("gui"))
    if s:gui_size=='norm'
      let s:gui_size='big'
      set columns=102
      set lines=32
    else
      set columns=120
      set lines=40
      let s:gui_size='norm'
    endif
  endif
endfunction
let s:gui_size='norm'

if has("gui_running")
  set guifont=Monospace\ 10
  set cursorline
  set go=aegitt
  call GeomToggle()
  nmap <F4> :call GeomToggle()<CR>
  imap <F4> <Esc><F4>a
  " Map Alt-keys for fontsize
  nmap <M-+> <Plug>FontsizeInc
  nmap <M-=> <Plug>FontsizeInc
  nmap <M--> <Plug>FontsizeDec
  nmap <M-0> <Plug>FontsizeDefault
endif

" Settings for tpope's surround plugin
let g:surround_45 = "<% \r -%>"
let g:surround_61 = "<%= \r %>"
autocmd FileType php let b:surround_45 = "<?php \r ?>"

" Settings for rails plugin
let g:rails_default_file='config/database.yml'
autocmd User Rails silent! Rlcd

" NERDTree settings
map <silent> <M-d> :execute 'NERDTreeToggle'<CR>
let g:NERDTreeWinSize=25

" Set filetype for nginx confs
au BufRead,BufNewFile /usr/local/conf/* set ft=nginx

" XPTemplate setings
let g:xptemplate_vars = 'author=J.Infield&email=jinfield@gmail.com&SParg='
let g:xptemplate_bundle = 'javascript_jquery'

" Misc mappings
map <silent> <M-c> :lcd %:p:h <CR>   " change to cwd of current file
imap <C-Enter> <Down>
imap <C-BS> <C-o>cc
imap <M-o> <CR><CR><Up><Space><Space>
imap <silent> <M-j> <C-o>J
map <F1> <Esc>
imap <F1> <Esc>
