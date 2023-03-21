" Use zo to open the fold under the cursor.
" Use zc to close the fold under the cursor.
" Use zR to open all folds.
" Use zM to close all folds.
" Type :help folding for more information.
" You're welcome ;)


" GENERAL ---------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Remove mode display
set noshowmode

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    " Statusbar
    Plug 'itchyny/lightline.vim'
    Plug 'ojroques/vim-scrollstatus'

    Plug 'ryanoasis/vim-devicons'

    " Files
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Coding
    Plug 'tpope/vim-surround'
    Plug 'mattn/emmet-vim'
    Plug 'dense-analysis/ale'
    Plug 'maximbaz/lightline-ale'

    " Writing
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'kana/vim-textobj-user', {'for': ['markdown', 'text', 'wiki']}
    Plug 'preservim/vim-textobj-quote', {'for': ['markdown', 'text', 'wiki']}
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

    " Colorschemes
    Plug 'sainnhe/everforest'

call plug#end()

let g:vimwiki_list = [{ 'path': '~/Documents/VimWiki' }]

" }}}


" COLORSCHEMES ----------------------------------------------------------- {{{

" Important!!
if has('termguicolors')
    set termguicolors
endif

set background=dark

" Set contrast
" Available values: 'hard', 'medium' (default), 'soft'.
let g:everforest_background = 'soft'

" For better performance
let g:everforest_better_performance = 1

" Enable italics
let g:everforest_enable_italic = 1

colorscheme everforest

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
"nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Basic autopai
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Install Vim-Plug automatically if needed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VimWiki
command! WBlog VimwikiAll2HTML
autocmd FileType vimwiki autocmd BufWritePost <buffer> Vimwiki2HTML
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

function! WordCount()
    let currentmode = mode()
    if !exists("g:lastmode_wc")
        let g:lastmode_wc = currentmode
    endif
    " if we modify file, open a new buffer, be in visual ever, or switch modes
    " since last run, we recompute.
    if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
        let g:lastmode_wc = currentmode
        let l:old_position = getpos('.')
        let l:old_status = v:statusmsg
        execute "silent normal g\<c-g>"
        if v:statusmsg == "--No lines in buffer--"
            let b:wordcount = 0
        else
            let s:split_wc = split(v:statusmsg)
            if index(s:split_wc, "Selected") < 0
                let b:wordcount = str2nr(s:split_wc[11])
            else
                let b:wordcount = str2nr(s:split_wc[5])
            endif
            let v:statusmsg = l:old_status
        endif
        call setpos('.', l:old_position)
        return b:wordcount
    else
      return b:wordcount
    endif
endfunction

" Ale
let g:ale_enabled = 0

"let g:ale_sign_error = '×'
"let g:ale_sign_warning = '»'
let g:ale_sign_warning = "\uf071"
let g:ale_sign_error = "\uf05e"
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_linters = {
            \   'markdown': ['proselint', 'languagetool'],
            \   'text': ['proselint', 'languagetool'],
            \   'wiki': ['proselint', 'languagetool'],
	        \   'python': ['pyls', 'autoimport', 'flake8', 'yapf'],
            \   }
let g:ale_fixers = {
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

" NERDTree
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeHighlightCursorline = 0

let NERDTreeShowHidden=1

" Limelight + Goyo
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 0

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" vim-markdown
let g:vim_markdown_folding_disabled = 1
"quote stuff (curly instead of normal "", qc to autocorrect)
nnoremap <silent> qr <Plug>ReplaceWithCurly
"spell check for only markdown
autocmd FileType markdown setlocal spell
"set to conceal formatting by default to not clutter
set conceallevel=2

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

"lazy load vim-fuigitive
command! Gstatus call LazyLoadFugitive('Gstatus')
command! Gdiff call LazyLoadFugitive('Gdiff')
command! Glog call LazyLoadFugitive('Glog')
command! Gblame call LazyLoadFugitive('Gblame')
function! LazyLoadFugitive(cmd)
  call plug#load('vim-fugitive')
  call fugitive#detect(expand('%:p'))
  exe a:cmd
endfunction

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Show the status on the second to last line.
set laststatus=2

let g:lightline = {
    \ 'colorscheme': 'everforest',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             ['gitbranch',  'filetype', 'filename', 'wordcount', 'modified', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ],
    \   'right': [ ['fileformat'],
    \              [ 'relativepath', 'readonly', 'percent', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]]
    \ },
    \ 'component_function': {
    \    'filetype': 'MyFiletype',
    \    'fileformat': 'MyFileformat',
    \    'wordcount': 'WordCount',
    \    'gitbranch': 'FugitiveHead',
    \    'readonly': 'LightlineReadonly',
    \    'percent' : 'ScrollStatus',
    \ },
    \ 'component_expand': {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_infos': 'lightline#ale#infos',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \   'linter_checking': 'right',
    \   'linter_infos': 'right',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'right',
    \ },
    \ 'component': {
    \   'lineinfo': '%3l:%-2v%<',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

" Add devicon to lightline
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Lightline ale
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

" Transparency
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort

" transparent background in statusbar
let l:palette = lightline#palette()
let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let l:palette.insert.middle = l:palette.normal.middle
let l:palette.visual.middle = l:palette.normal.middle
let l:palette.inactive.middle = l:palette.normal.middle
let l:palette.inactive.middle = l:palette.normal.middle
let l:palette.tabline.middle = l:palette.normal.middle
call lightline#colorscheme()
endfunction

" }}}
