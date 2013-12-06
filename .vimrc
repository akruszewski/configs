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
set laststatus=2
set statusline=%{GitBranch()}
set autochdir

highlight ColorColumn ctermbg=233
let mapleader = "," 

let g:NERDTreeWinPos = "right"

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline_section_b = '%{fugitive#head()}'

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()'

let g:pymode_rope = 0

let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all

set runtimepath^=~/.vim/bundle/ctrlp.vim

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
nmap <F8> :TagbarToggle<CR> 

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
