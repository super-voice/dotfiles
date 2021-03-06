set nocompatible               " be iMproved
if has("unix")
  set shell=bash
endif
scriptencoding utf-8
filetype off  " required!
set rtp+=~/.vim/bundle/vundle.vim/
call vundle#begin() "required
" let Vundle manage Vundle
" required!
"
" original repos on github
Plugin 'VundleVim/vundle.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'elzr/vim-json'
Plugin 'othree/eregex.vim'
Plugin 'nanotech/jellybeans.vim'
" Plugin 'rizzatti/dash.vim'
Plugin 'jimenezrick/vimerl'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'dleonard0/pony-vim-syntax'
Plugin 'davidhalter/jedi-vim'
Plugin 'xolox/vim-misc'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" lua support on windows is optional
if has('lua')
  Plugin 'Shougo/neocomplete.vim'
endif
Plugin 'brandonbloom/csearch.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'airblade/vim-gitgutter.git'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" vim-scripts repos
Plugin 'L9'
if !has('win32') && !has('win32unix')
  Plugin 'Chilledheart/vim-clangd'
endif
" non github repos
" git repos on your local machine (ie. when working on your own plugin)

call vundle#end() "required
" ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           pre-filetype tweaks                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           reset vimrc augroup                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on "required

augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
  au! BufRead,BufNewFile *.td     set filetype=tablegen
  au! BufRead,BufNewFile *.rst    set filetype=rest
  au! BufRead,BufNewFile *.proto  set filetype=proto
  au! BufRead,BufNewFile *.gyp    set filetype=python expandtab tabstop=2 shiftwidth=2
  au! BufRead,BufNewFile *.gypi   set filetype=python expandtab tabstop=2 shiftwidth=2
  au! BufRead,BufNewFile DEPS     set filetype=python expandtab tabstop=2 shiftwidth=2
  au! BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
  au! BufRead,BufNewFile *.pony   set filetype=pony
  au! BufRead,BufNewFile *.fbs    set filetype=flatbuffers
  au! BufRead,BufNewFile *.swift  set filetype=swift expandtab tabstop=2 shiftwidth=2 comments=s1:/*,mb:*,ex:*/,:///,://
  au! BufRead,BufNewFile *.swift.gyb set filetype=swiftgyb expandtab tabstop=2 shiftwidth=2 comments=s1:/*,mb:*,ex:*/,:///,://
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            General settings                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: transfer all our custom mapping to our vim_shortcuts file

" DISPLAY SETTINGS
colorscheme jellybeans    " sets the colorscheme
set scrolloff=2         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set undofile            " stores undo state even when files are closed (in undodir)
set cursorline          " highlights the current line
set winaltkeys=no       " turns of the Alt key bindings to the gui menu
set number

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu            " completion with menu
" This changes the default display of tab and CR chars in list mode
set list listchars=tab:▸\ ,eol:¬,trail:·,extends:#,nbsp:·

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab

" EDITOR SETTINGS
"set ignorecase          " case insensitive searching
"set smartcase           " but become case sensitive if you type uppercase characters
" this can cause problems with other filetypes
" see comment on this SO question http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/234578#234578
"set smartindent         " smart auto indenting
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set cindent             " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4  " see :h cinoptions-values
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set nobackup            " no backup~ files.

set tabstop=2           " number of spaces a tab counts for
set shiftwidth=2        " spaces for autoindents
set softtabstop=2
set shiftround          " makes indenting a multiple of shiftwidth
set expandtab           " turn a tab into spaces
" vim-airline doesn't appear until I create a new split
set laststatus=2        " the statusline is now always shown
set noshowmode          " don't show the mode ("-- INSERT --") at the bottom

" misc settings
set fileformat=unix     " file mode is unix
set fileformats=unix,dos,mac   " detects unix, dos, mac file formats in that order

set viminfo='20,\"1000   " remember copy registers after quitting in the .viminfo
" file -- 20 jump links, regs up to 500 lines'

set hidden              " allows making buffers hidden even with unsaved changes
set history=1000        " remember more commands and search history
set undolevels=1000     " use many levels of undo
set autoread            " auto read when a file is changed from the outside
set mouse=a             " enables the mouse in all modes
set foldlevelstart=99   " all folds open by default

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=<F7>

" Right-click on selection should bring up a menu
set mousemodel=popup_setpos

" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" this solves the "unable to open swap file" errors on Win7
set dir=~/tmp,/var/tmp,/tmp,$TEMP
set undodir=~/tmp,/var/tmp,/tmp,$TEMP

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until the
" root.
set tags=./tags;/

" turns off all error bells, visual or otherwise
set noerrorbells visualbell t_vb=
autocmd vimrc GUIEnter * set visualbell t_vb=

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set antialias
  " we use lazy redraw
  set lazyredraw
endif

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Number of screen lines to use for the command-line
set cmdheight=2

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l
set nohlsearch          " do not highlight searched-for phrases
set incsearch           " ...but do highlight-as-I-type the search string
set gdefault            " this makes search/replace global by default

" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
set textwidth=120

" this makes the color after the textwidth column highlighted
set colorcolumn=+1

" options for formatting text; see :h formatoptions
set formatoptions=tcroqnj

if v:version >= 704
  " The new Vim regex engine is currently slooooow as hell which makes syntax
  " highlighting slow, which introduces typing latency.
  " Consider removing this in the future when the new regex engine becomes
  " faster.
  set regexpengine=1
endif

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
  for i in range(1, 9)
    exec "nnoremap <D-".i."> ".i."gt"
  endfor
  set transparency=10
endif

if has("unnamedplus")
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif


" In UltiSnips snippet files, we want actual tabs instead of spaces for indents.
" US will use those tabs and convert them to spaces if expandtab is set when the
" user wants to insert the snippet.
autocmd vimrc FileType snippets set noexpandtab

" The stupid javascript filetype plugin overrides our settings!
autocmd vimrc FileType javascript
      \ set tabstop=2 |
      \ set shiftwidth=2 |
      \ set softtabstop=2

autocmd vimrc FileType python
      \ set tabstop=4 |
      \ set shiftwidth=4 |
      \ set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           More involved tweaks                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

augroup vimrc
" Automatically delete trailing DOS-returns and whitespace on file open and
" write.
  autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
augroup END

nnoremap <leader>w :silent! %s/[\r \t]\+$//<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /[\r \t]\+$/

" this maximizes the gvim window on startup
if has("gui_win32")
  " this maximizes on windows
  au vimrc GUIEnter * simalt ~x
else
  au vimrc GUIEnter * set lines=999 columns=999
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Sets a font for the GUI
if has("gui_gtk3")
  " fedora 25 has it
  set guifont=Consolas\ 11
elseif has("gui_gtk2")
  set guifont=Consolas\ Regular\ 10
elseif has("gui_macvim")
  " My Mac has a fairly high DPI so the font needs to be bigger
  set guifont=Monaco:h12
elseif has("gui_win32")
  set guifont=Consolas:h11
end

" Sometimes, $MYVIMRC does not get set even though the vimrc is sourced
" properly. So far, I've only seen this on Linux machines on rare occasions.
if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.vimrc'
endif

" Highlight Class and Function names
function! s:HighlightFunctionsAndClasses()
  syn match cCustomFunc      "\w\+\s*\((\)\@="
  syn match cCustomClass     "\w\+\s*\(::\)\@="

  hi def link cCustomFunc      Function
  hi def link cCustomClass     Function
endfunction

" Highlight Class and Function names, D specific
function! s:HighlightDFunctionsAndClasses()
  syn match cCustomDFunc     "\w\+\s*\(!.\{-}(\)\@="
  syn match cCustomDFuncUFCS ".\w\+\s*\(!.\{-}\)\@="

  hi def link cCustomDFunc     Function
  hi def link cCustomDFuncUFCS Function
endfunction

" TODO: this should:
" a) not be called for every filetype
" b) be in a separate plugin
au vimrc Syntax * call s:HighlightFunctionsAndClasses()
au vimrc Syntax d call s:HighlightDFunctionsAndClasses()


" TODO: split this into separate plugin
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    execute "Ack " . l:pattern . ' %'
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" cindent is a bit too smart for its own good and triggers in text files when
" you're typing inside parens and then hit enter; it aligns the text with the
" opening paren and we do NOT want this in text files!
autocmd vimrc FileType text,markdown,gitcommit set nocindent

autocmd vimrc FileType markdown setlocal spell! spelllang=en_us

au vimrc BufReadCmd *.epub call zip#Browse( expand( "<amatch>" ) )


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                tagbar                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_left = 0
let g:tagbar_right = 0
let g:tagbar_sort = 0
let g:tagbar_ctags_bin = '/usr/bin/ctags'
" for mac, the default ctags doesn't work
if has("gui_macvim")
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif
" fallback to path find
if !executable(g:tagbar_ctags_bin)
  let g:tagbar_ctags_bin = 'ctags'
endif

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                tabular                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" looks at the current line and the lines above and below it and aligns all the
" equals signs; useful for when we have several lines of declarations
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
vnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
nnoremap <Leader>a, :Tabularize /,/l0r1<CR>
vnoremap <Leader>a, :Tabularize /,/l0r1<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              syntastic                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('win32') && !has('win32unix')
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
else
  let g:syntastic_error_symbol = 'X'
  let g:syntastic_warning_symbol = 'x'
endif
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
"autocmd QuickFixCmdPost *grep* cwindow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             CtrlP                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Set delay to prevent extra search
let g:ctrlp_lazy_update = 350
" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0
" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0
" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --hidden -g ""'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       PyMatcher for CtrlP                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('python') && !has('python3')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       UltiSnips                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger       = "<c-tab>"
let g:UltiSnipsListSnippets        = "<c-s-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               gerrit                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable spell checking, which is not on by default for commit messages.
au FileType gitcommit setlocal spell
" Reset textwidth if you've previously overridden it.
au FileType gitcommit setlocal textwidth=72
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               clangd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType c,cpp,objc,objcpp nnoremap <leader>j :ClangdGotoDefinition<CR>
au FileType c,cpp,objc,objcpp nnoremap <leader>d :ClangdShowDetailedDiagnostic<CR>
au FileType c,cpp,objc,objcpp nnoremap <leader>c :ClangdShowCursorDetail<CR>

let g:clangd#completions_enabled = 1
let g:clangd#log_level = 'info'
"let g:clangd#clangd_executable = '~/build-llvm/bin/clangd'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clang_format "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format_fallback_style = 'llvm'

if !has('win32') && !has('win32unix')
 au FileType c,cpp,objc,objcpp nnoremap <buffer><Leader>cf :ClangdFormat<CR>
 au FileType c,cpp,objc,objcpp vnoremap <buffer><Leader>cf :<C-u>ClangdFormat<CR>
elseif has('python3')
 au FileType c,cpp,objc,objcpp nnoremap <buffer><Leader>cf :<C-u>py3f ~/dotfiles/clang-format.py<CR>
 au FileType c,cpp,objc,objcpp vnoremap <buffer><Leader>cf :py3f ~/dotfiles/clang-format.py<CR>
elseif has('python')
 au FileType c,cpp,objc,objcpp nnoremap <buffer><Leader>cf :<C-u>pyf ~/dotfiles/clang-format.py<CR>
 au FileType c,cpp,objc,objcpp vnoremap <buffer><Leader>cf :pyf ~/dotfiles/clang-format.py<CR>
endif
au FileType go nnoremap <buffer><Leader>cf :<C-u>!gofmt -w=true % <CR>
"au FileType go vnoremap <buffer><Leader>cf :!gofmt % <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yapf "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! YAPF() range
  " Determine range to format.
  let l:line_ranges = a:firstline . '-' . a:lastline
  let l:cmd = 'yapf --lines=' . l:line_ranges

  " Call YAPF with the current buffer
  let l:formatted_text = system(l:cmd, join(getline(1, '$'), "\n") . "\n")

  " Update the buffer.
  execute '1,' . string(line('$')) . 'delete'
  call setline(1, split(l:formatted_text, "\n"))

  " Reset cursor to first line of the formatted range.
  call cursor(a:firstline, 1)
endfunction

command! -range=% YAPF <line1>,<line2>call YAPF()
au FileType python nnoremap <buffer><Leader>cf :call <C-u>YAPF()<CR>
au FileType python vnoremap <buffer><Leader>cf :call YAPF()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-jedi                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_select_first = 0
let g:jedi#goto_command = "<leader>j"
let g:jedi#completions_command = "<C-S-Space>"
let g:jedi#call_signatures_command = "''"
let g:jedi#goto_assignments_command = "''"
let g:jedi#usages_command = "''"
let g:jedi#rename_command = "''"
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               neocomplete                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
if exists('g:jedi#completions_enabled') && !g:jedi#completions_enabled
  let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  autocmd FileType python setlocal omnifunc=jedi#completions
endif

" setup clangd for neocomplete usage
if exists('g:clangd#completions_enabled') && !g:clangd#completions_enabled
  let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

  autocmd FileType c,cpp,objc,objcpp setlocal omnifunc=clangd#OmniCompleteAt
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
" autocmd VimEnter * call airline#parts#define_function('clangd', 'ClangdStatuslineFlag')
" let g:airline_section_warning = airline#section#create(['clangd', 'syntastic', 'eclim', 'whitespace'])
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shortcuts "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :TagbarToggle<cr><c-w>=
nnoremap <leader>l :GitGutterToggle<CR>
nnoremap <leader>p :r !tmux save-buffer -<CR>
nnoremap <leader>s :w !sudo tee %<CR>
nnoremap <leader>T :!ctags -R --languages=C,C++,Go,protobuf --fields=+l --exclude=.git --exclude=build --exclude=out --verbose<CR>
" Toggles '/' to mean eregex search or normal Vim search
nnoremap <leader>/ :call eregex#toggle()<CR>

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 7
let g:eregex_default_enable = 0

function! LinuxFormat()
  set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
  autocmd FileType c,cpp,objc,objcpp setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
endfunction
nnoremap <leader>L :call LinuxFormat()<CR>
