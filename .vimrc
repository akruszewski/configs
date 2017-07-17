"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set number
set colorcolumn=80
set ts=4
set sts=4
set sw=4
set laststatus=2
set expandtab
set autochdir

" ctags file
set tags+=./tags;

set relativenumber
set number

set wildchar=<Tab> wildmenu wildmode=full

highlight ColorColumn ctermbg=115
let mapleader = ","

autocmd Filetype html setlocal ts=4 sw=4 expandtab

"support for syntax highlighting in some file types
autocmd BufRead,BufNewFile *.nxml :set ft=xml
autocmd BufRead,BufNewFile *.zcml :set ft=xml

set spell spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins repos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" start vundle plugin list

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"""""""
" coding related
"""""""

" Auto completition
Plugin 'Valloric/YouCompleteMe'

"" Commented until I will start use it
" snippets
"Plugin 'SirVer/ultisnips'

" snippets library
" Plugin 'honza/vim-snippets'

" show structure of the code
Plugin 'https://github.com/majutsushi/tagbar.git'

" braces
Plugin 'git://github.com/jiangmiao/auto-pairs.git'
Plugin 'tpope/vim-surround'

" syntax checking
Plugin 'scrooloose/syntastic'

" Python plugins
Plugin 'nvie/vim-flake8'

" html from pseudo css selector. Awesome! ex. div.foo>div.bar>input#baz <c-y>,
Plugin 'mattn/emmet-vim'

" show indentation
Plugin 'https://github.com/Yggdroot/indentLine'

"""""""
" color schemes
"""""""
Plugin 'chriskempson/base16-vim'
Plugin 'wimstefan/Lightning'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'https://github.com/alexjgriffin/sprinkles'
Plugin 'https://github.com/nightsense/seabird'


"""""""
" various
"""""""

" easy motions, example: <leader><leader>w
Plugin 'easymotion/vim-easymotion'

" File browser <leader>t
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Fuzzy search <3
Plugin 'https://github.com/kien/ctrlp.vim'

" better buff explorer
Plugin 'https://github.com/jlanzarotta/bufexplorer.git'

" git plugin
Plugin 'tpope/vim-fugitive'

" Wiki
Plugin 'https://github.com/vimwiki/vimwiki.git'

" beautify reading
Plugin 'junegunn/goyo.vim'

" move visual blocks of code
Plugin 'https://github.com/gavinbeatty/dragvisuals.vim'

" undo tree visualization
Plugin 'sjl/gundo.vim'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" LISP syntax highlighting
Plugin 'NLKNguyen/vim-lisp-syntax'
Plugin 'https://github.com/kovisoft/paredit'

" vim shell
Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme seagull
"set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function for toggle bars in GUI mode
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:NERDTreeWinPos = "right"

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"noremap <C-n> :nohl<CR>
"vnoremap <C-n> :nohl<CR>
"inoremap <C-n> :nohl<CR>

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

" plugins keys
map <Leader>t :NERDTreeTabsToggle<CR>
map <F11> <Esc>:call ToggleGUICruft()<cr>
nmap <F8> :TagbarToggle<CR> 
nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nmap <Leader>wf <Plug>VimwikiFollowLink
" nnoremap <C-n> :call NumberToggle()<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let python_highlight_all = 1
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ " this one is also c related

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" :w!! 
" " write the file when you accidentally opened it without the right (root)
" privileges
cmap w!! w !sudo tee % > /dev/null
