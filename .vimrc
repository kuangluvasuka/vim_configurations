" Use Vundle to manage plugins
" lk's

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let tagbar_left=1 
let tagbar_width=16

Plugin 'scrooloose/nerdtree'
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeWinPos='right'
let NERDTreeWinSize=20

Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_perl_checker = 1
let g:syntastic_python_python_exec = '/usr/bin/python'

Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set tags+=/data/misc/software/misc./vim/stdcpp.tags
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_min_num_identifier_candidate_chars=5
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<M-;>'

Plugin 'eapache/rainbow_parentheses.vim'
syntax on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level	= 1
let g:indent_guides_auto_colors = 1

Plugin 'vim-perl/vim-perl'
function! RunCmd(cmd)
    let fn = expand("%:p")
    let ft = &l:filetype
    botright copen
    setlocal modifiable
    %d _
    silent execute "read !".a:cmd." ".fn
    1d _
    normal! 0
    if ft != ""
        execute "setf ".ft
    else
        setlocal filetype=
    endif
    setlocal nomodifiable nomodified
    wincmd p
endfunction

command! -nargs=1 Run     call RunCmd(<q-args>)
command!          Runperl call RunCmd("/usr/bin/perl")
nmap <F5> :Runperl<CR>
"To use: Runperl, :Run perl, F5

Plugin 'hdima/python-syntax'
let python_highlight_all = 1
let python_highlight_space_errors = 0

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""
colorscheme solarized
set number
set ruler
set showmatch
set incsearch
set hlsearch
set autoindent
set smartindent
set nofoldenable
set foldmethod=syntax
set smarttab
set expandtab
set softtabstop=4
set linebreak
set showbreak=+++
set shiftwidth=4
set textwidth=110
"set laststatus=2
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
