call pathogen#infect()
call pathogen#helptags()
autocmd! bufwritepost .vimrc source %

syntax on
filetype off
filetype plugin indent on

" set guioptions = 1 " by default, hide gui menus
set number
set colorcolumn=80
set ts=4
set sts=4
set sw=4
highlight ColorColumn ctermbg=233
let mapleader = "," 
let g:NERDTreeWinPos = "right"
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()'

colorscheme molokai


" function for toggle bars in gui mode
function! ToggleGUICruft()
    if &guioptions=='i'
        exec('set guioptions=imTrL')
    else
        exec('set guioptions=i')
    endif
endfunction

" function for set relative/static line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set relativenumber
        set number
    else
        set relativenumber
    endif
endfunc


"support for syntax higligting in some filetypes
autocmd BufRead,BufNewFile *.nxml :set ft=xml
autocmd BufRead,BufNewFile *.zcml :set ft=xml



"keys
map <Leader>t :NERDTreeTabsToggle<CR>
map <F11> <Esc>:call ToggleGUICruft()<cr>
map <Leader>s :PymodeLint<cr>

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

vnoremap < <gv
vnoremap > >gv


nnoremap <C-n> :call NumberToggle()<cr>
