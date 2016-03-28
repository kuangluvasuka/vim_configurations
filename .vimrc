" ZXL Vim Configuration
" Initial Configuration time: Feb, 2014
" Last Configuration time: Sept 28, 2014

""""""""""""""Vim 常用快捷键"""""""""""""""""""""""""""""
"<leader>	using sequences of keys to perform a command, default is backslash "\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""现有Plugin快捷键表"""""""""""""""""""""""""
"F7: NERDtree插件，打开树状文件管理列表； Mac：Fn+F7
"F8: tagbar插件，显示代码outline;Mac: Fn+F8
"：CtrlP:打开CtrlP快速查找插件
"\cc：注释该行；\cu:解开注释；	Shift+V:选取多行；nerdcommenter插件





""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""长久不用不记得的""""""""""""
".vimrc是配置文件
".vim目录存放插件和其他工具
"都在Home目录下

"转移Vim到其他电脑：
"把.vim文件夹和.vimrc复制到新电脑
"	管理插件使用了Vundle
"	大多数插件在复制后可以直接使用，YouCompleteMe需要重新编译，方法见下
""""""""""""""""""""""""""""""""""""""

""""""""""""YouCompleteMe（YCM）重新编译（安装）方法"""""""
"细节需要参阅 https://github.com/Valloric/YouCompleteMe/blob/master/README.md

"I) Mac OS X下的安装：
"	1.安装Homebrew http://brew.sh/
"		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
"	2. 用Homebrew安装CMake
"		brew install cmake
"	3.安装支持C语言的YCM
"		cd ~/.vim/bundle/YouCompleteMe
"		./install.sh --clang-completer
"	4.完成

"II) Install YouCompleteMe on Ubuntu 14.04 x64"""""""
"sudo apt-get install build-essential cmake
"cd ~/.vim/bundle/YouCompleteMe
"./install.sh --clang-completer

"III) 安装完成后，编辑YCM配置文件
"	Edit .ycm_extra_conf.py in YCM folder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""下面的配置是给VimGUI的（比如MacVim）"""""""""""""""""""
"MacVim包中的mvim文件可以放到Mac下的/usr/local/bin, Terminal下mvim可以打开MacVim
"替代系统自带的vim命令：ln -s /usr/local/bin/mvim vim

"if has("gui_running")
"    set guioptions=F	"Show toolbar
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""Vim的通用配置"""""""""""""""""""""""""""
"显示行号
set nu "Display Line Number

""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""Vundle的配置""""""""""""""""
"To install Vundle: （复制.vim到新电脑后vundle不需要再次安装，可以直接用）
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

"let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"scripts on GitHub repos, examples
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'tpope/vim-rails.git'
"The sparkup vim script is in a subdirectory of this repo called vim.
"Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"scripts from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Plugin 'FuzzyFinder'
"scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"...

filetype plugin indent on     " required
"To ignore plugin indent changes, instead use:
"filetype plugin on

"Vundle的快速使用说明：
":PluginList          - list configured plugins
":PluginInstall(!)    - install (update) plugins
":PluginSearch(!) foo - search (or refresh cache first) for foo
":PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""CtrlP""""""""""""""""""""""""""
Plugin 'kien/ctrlp.vim'  "Vim中快速查找插件
"Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
"具体使用方法见 https://github.com/kien/ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""nerdcommenter""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'	"快速加/* */注释 

"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""delimitMate""""""""""""""""""""
Plugin 'Raimondi/delimitMate'	"输入引号,括号时,自动补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""tagbar""""""""""""""""""""""""""""
Plugin 'majutsushi/tagbar'	"显示代码outline

nmap <F8> :TagbarToggle<CR>
" Need to install ctags first: sudo apt-get install ctags
" OS X: brew install ctags

"F8 to enable outline display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""NEDRtree""""""""""""""""""""""""""
Plugin 'vim-scripts/The-NERD-tree'  "Vim中树状文件夹列表

":help NERDtree  => to see usage
":NERDtree => open NERDtree
"Map F7 to open NERDTree
nmap <F7> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""Syntastic"""""""""""""""""""""""""
Plugin 'scrooloose/syntastic'	  "实时syntax检查，基于llvm
"let g:ycm_show_diagnostics_ui = 0

let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']   " liukuang
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'

let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 1
"set error or warning signs
let g:syntastic_error_symbol = '擦' "'✗'
let g:syntastic_warning_symbol = '⚠'

"When set to 2 the error window will be automatically closed when
"no errors are detected, but not opened automatically.
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
"whether to show balloons
let g:syntastic_enable_balloons = 1

let g:syntastic_enable_perl_checker = 1

let g:syntastic_python_python_exec = '/usr/bin/python'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""YouCompleteMe Plugin""""""""""""""""""""
Bundle 'Valloric/YouCompleteMe'
"Plugin 'Valloric/YouCompleteMe'   "YouCompleteMe自动语法补全
"
""补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
"
"let g_ycm_enable_diagnostic_signs = 1
""Global Configuration file
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"
""允许 vim 加载 Local Project .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
"
""开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
"
""引入C++标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
set tags+=/data/misc/software/misc./vim/stdcpp.tags
"
""YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
"
""补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
"
""从第n个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_min_num_identifier_candidate_chars=5
"
""禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"
""语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"
""修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ';'
"let g:ycm_key_invoke_completion = '<M-;>'
"
""设置转到定义处的快捷键为CRTL + G
"nmap <C-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
"
""默认的设置与Ultisnips冲突，添加下面的代码后，就可以和Ultisnips一起工作了.
""let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
""let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
"
"let g:ycm_semantic_triggers =  {
"            \   'c' : ['->', '.'],
"            \   'objc' : ['->', '.'],
"            \   'ocaml' : ['.', '#'],
"            \   'cpp,objcpp' : ['->', '.', '::'],
"            \   'perl' : ['->'],
"            \   'php' : ['->', '::'],
"            \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
"            \   'ruby' : ['.', '::'],
"            \   'lua' : ['.', ':'],
"            \   'erlang' : [':'],
"            \ }
"let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""RainbowParentheses"""""""""""""""""""""""""
Plugin 'kien/rainbow_parentheses.vim'	"彩色括号插件

let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""Vim PowerLine"""""""""""""""""""""""""""""
"Plugin 'Lokaltog/vim-powerline'		"状态栏美化插件

"let g:Powerline_symbols = 'fancy'
"set laststatus=2 " Always show the statusline
"set encoding=utf-8 " Necessary to show Unicode glyphs
"set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""vim-indent-guides"""""""""""""""""""""""
Plugin 'nathanaelkane/vim-indent-guides'	"可视化缩进

let g:indent_guides_enable_on_vim_startup = 0	"默认关闭
let g:indent_guides_guide_size = 1	"指定对齐线尺寸
let g:indent_guides_start_level	=	1	"从第二行开始可视化缩进

"color
let g:indent_guides_auto_colors = 1

" \ig	打开关闭功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""Perl Related"""""""""""""""""""""""""""""
Plugin 'vim-perl/vim-perl'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""Run Perl Script"""""""""""""""""""""""""""

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

"To use:
":Runperl
":Run perl
"F5

"Notice:
"Perl script has to use the following commands to open file in this mode:
"use FindBin;  #$FindBin::Bin/ => current working directory
"my $filename = "$FindBin::Bin/xxx.txt"

"After execution, vim will open Quickfix list window
"Ctrl - w to switch between windows
":ccl close quickfix
":copen open quickfix
":cnf go to the first error
":cn next error
":cw open if there are errors, otherwise closed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""Python Related""""""""""""""""""""""""
Plugin 'hdima/python-syntax'
let python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""About Color Profile""""""""""""""""""""""""
" See http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
" My Fav List:
" wombat256
" molokai
" paintbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""Current Color Profile"""""""""""""""""""""""""
":colorscheme corporation_modified
:colorscheme xcodelike

""""""""""""""Indent settings"""""""""""""""""""""""""""
set autoindent
set shiftwidth=4
set hlsearch
set smartindent
set smarttab
set softtabstop=4
set expandtab

""""""""""""""Others"""""""""""""""""""""
set linebreak
set showbreak=+++
set textwidth=110
set showmatch
set incsearch
set ruler

