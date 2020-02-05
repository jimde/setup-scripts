set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
set list

colorscheme badwolf
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set cursorline

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
call plug#end()

" vim-gitter stuff
set updatetime=4000

set colorcolumn=81

" https://stackoverflow.com/questions/1562633/setting-vim-whitespace-preferences-by-filetype
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
