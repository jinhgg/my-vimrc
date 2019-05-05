set wrap "自动换行显示
set nocompatible "去掉vi的一致性
set number "显示行号    
set guioptions-=r "隐藏滚动条
set guioptions-=L "隐藏滚动条
set guioptions-=b "隐藏滚动条
set showtabline=0 "隐藏顶部标签栏
set guifont=Monaco:h13 "设置字体         
syntax on   "开启语法高亮
let g:solarized_termcolors=256  "solarized主题设置在终端下的设置
set background=dark     "设置背景色
set nowrap  "设置不折行
set fileformat=unix "设置以unix的格式保存文件
set cindent     "设置C样式的缩进格式
set tabstop=4   "设置table长度
set shiftwidth=4        "同上
set showmatch   "显示匹配的括号
set scrolloff=5     "距离顶部和底部5行
set laststatus=2    "命令行为两行
set fenc=utf-8      "文件编码
set backspace=2
set mouse=a     "启用鼠标
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写
set incsearch
set hlsearch        "高亮搜索项
set noexpandtab     "不允许扩展table
set whichwrap+=<,>,h,l
set autoread
hi Pmenu ctermbg=grey
hi PmenuSel ctermbg=white

"按F5运行python
map <F5> :w<CR> :call RunPython()<CR>
autocmd FileType python noremap <buffer> <leader>s :call Autopep8()<CR> :w<CR>
function RunPython()
	let mp = &makeprg
	let ef = &errorformat
	let exeFile = expand("%:t")
	setlocal makeprg=python\ -u
	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
	silent make %
	copen
	let &makeprg = mp
	let &errorformat = ef
	redraw!
	endfunction

"设置leader键为,
let mapleader=','
",+ci 代码注释/反注释
map <leader>ci <CR>



"默认配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径
let g:ycm_path_to_python_interpreter='/usr/bin/python3'
"是否开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口
let g:ycm_autoclose_preview_window_after_completion=0
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全
let g:ycm_complete_in_strings = 0
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '<CR>'     
"上下左右键行为
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


"ctrl e开启和关闭树
map <C-e> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签
let NERDTreeShowBookmarks=1
"设置忽略文件类型
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小
let NERDTreeWinSize=25

"缩进指示线
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置
let g:autopep8_disable_show_diff=1

" 是否启用顶部tabline
 let g:airline#extensions#tabline#enabled = 1
 "顶部tabline显示方式
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'

 "设置切换Buffer快捷键
 nnoremap <C-h> :bn<CR>
 nnoremap <C-l> :bp<CR>
let g:airline#extensions#tabline#buffer_nr_show = 1 

map <leader>t :TagbarToggle<CR>
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'Valloric/YouCompleteMe'
	"目录树
	Plugin 'scrooloose/nerdtree'
	"一款缩进指示线
	Plugin 'Yggdroot/indentLine'
	"括号和引号自动补全
	Plugin 'jiangmiao/auto-pairs'
	"方便注释代码
	Plugin 'scrooloose/nerdcommenter'
	"工程中快速定位某个文件
	Plugin 'ctrlpvim/ctrlp.vim'
	"在工程中全局搜索某个特定的字符
	Plugin 'dyng/ctrlsf.vim'
	"显示文件中的类、函数、变量
	Plugin 'majutsushi/tagbar'
	"美观
	Plugin 'vim-airline/vim-airline'
	"代码一键pep8
	Plugin 'tell-k/vim-autopep8'
	call vundle#end()
	filetype plugin indent on



