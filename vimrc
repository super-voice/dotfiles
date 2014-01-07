set nocompatible               " be iMproved
set mouse=
set nobackup
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
execute pathogen#infect()
syntax on
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set showcmd

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'scrooloose/nerdtree'
 Bundle "MarcWeber/vim-addon-mw-utils"
 Bundle "tomtom/tlib_vim"
 Bundle "garbas/vim-snipmate"
 Bundle 'kien/ctrlp.vim'
 Bundle 'tpope/vim-surround'
 Bundle 'terryma/vim-multiple-cursors'
 Bundle 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim/'}

 Bundle 'tpope/vim-fugitive'

 Bundle 'Valloric/YouCompleteMe'
 Bundle 'scrooloose/syntastic'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'msanders/cocoa.vim'
 "Bundle 'eraserhd/vim-ios'
 Bundle 'wincent/Command-T'
 Bundle 'juvenn/mustache.vim'
 Bundle "pangloss/vim-javascript"
 Bundle 'maksimr/vim-jsbeautify'
 Bundle 'einars/js-beautify'

 " Bundle 'airblade/vim-gitgutter.git'
 " vim-scripts repos
 Bundle 'L9'
 " non github repos
 " git repos on your local machine (ie. when working on your own plugin)
 " ...
 let g:syntastic_c_compiler = 'clang'
 let g:syntastic_c_compiler_options = ' -std=c99 -I/Users/chilledheart/include -I/usr/local/include'
 let g:syntastic_cpp_compiler = 'clang++'
 let g:syntastic_cpp_compiler_options = ' -std=c++1y -I/Users/chilledheart/include -I/usr/local/include'
 let g:ycm_global_ycm_extra_conf = '/Users/chilledheart/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
  map <s-f> :call JsBeautify()<cr>
  autocmd FileType javascript noremap <buffer>  <s-f> :call JsBeautify()<cr>
  autocmd FileType html noremap <buffer> <s-f> :call HtmlBeautify()<cr>
  autocmd FileType css noremap <buffer> <s-f> :call CSSBeautify()<cr>
 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
