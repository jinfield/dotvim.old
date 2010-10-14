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

if has("gui_running")
  set guifont=Monospace\ 10
  set cursorline
  set go=aegitt
  set co=115
  set lines=40
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

" Session plugin settings
let g:session_autosave = 1
let g:session_autoload = 1
