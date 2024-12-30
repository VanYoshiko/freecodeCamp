colorscheme murphy
syntax on
syntax enable
set number 
set relativenumber 
set showcmd 
set wildmenu  
set wildmode=longest:full,full 
set laststatus=2 
set statusline=%(%2*%m%w%k%q\%*\%)%(%6*%<%f%*%)\%=%a%-4y%(\ %5*\ %n\ %*%)\%(%4*\ %l%*/%3*%L\ %*%1*%P%*%) 
hi User6 ctermfg=15 ctermbg=236 
hi User4 ctermfg=226 ctermbg=236 
hi User3 ctermfg=82 ctermbg=236 
hi User2 ctermfg=202 ctermbg=0
hi User5 ctermbg=243 ctermfg=15
hi User1 ctermfg=15 ctermbg=236 
hi StatusLine ctermfg=15 ctermbg=236 cterm=bold
hi StatusLineNC ctermfg=15 ctermbg=238 cterm=bold
let mapleadder = "<space>"
 nnoremap <space>o :bn<CR>
 nnoremap <space>p :bp<CR>
 
