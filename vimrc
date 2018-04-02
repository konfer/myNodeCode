" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
		syntax on " 语法高亮
		endif
		colorscheme ron " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

		" detect file type
		filetype on
		filetype plugin on

		" If using a dark background within the editing area and syntax highlighting
		" turn on this option as well
		set background=dark

		" Uncomment the following to have Vim jump to the last position when
		" reopening a file
		if has("autocmd")
				au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
				"have Vim load indentation rules and plugins according to the detected filetype
				filetype plugin indent on
				endif

				" The following are commented out as they cause vim to behave a lot
				" differently from regular Vi. They are highly recommended though.

				"set ignorecase " 搜索模式里忽略大小写
				"set smartcase " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
				set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
				set autoindent " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
				"set smartindent " 智能对齐方式
				set tabstop=4 " 设置制表符(tab键)的宽度
				set softtabstop=4 " 设置软制表符的宽度
				set shiftwidth=4 " (自动) 缩进使用的4个空格
				set cindent " 使用 C/C++ 语言的自动缩进方式
				set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式
				"set backspace=2 " 设置退格键可用
				set showmatch " 设置匹配模式，显示匹配的括号
				set linebreak " 整词换行
				set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
				"set hidden " Hide buffers when they are abandoned
				set mouse=a " Enable mouse usage (all modes) "使用鼠标
				set number " Enable line number "显示行号
				"set previewwindow " 标识预览窗口
				set history=50 " set command history to 50 "历史记录50条


				"--状态行设置--
				set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
				set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

				"--命令行设置--
				set showcmd " 命令行显示输入的命令
				set showmode " 命令行显示vim当前模式

				"--find setting--
				set incsearch " 输入字符串就显示匹配点
				set hlsearch
  
" 你在此设置运行时路径 
set rtp+=~/.vim/bundle/Vundle.vim  
 
" vundle初始化 
call vundle#begin()  
 
" 这应该始终是第一个 
Plugin 'gmarik/Vundle.vim' 
 
" sparkup vim脚本在名为vim的该软件库子目录下。 
" 传递路径，合理设置运行时路径。 
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} 
 
"Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
Plugin 'pangloss/vim-javascript'          " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
let g:NERDTreeDirArrows=0
let g:NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map tt :NERDTreeToggle<CR>
map ff :NERDTreeFind<CR>
Plugin 'msanders/snipmate.vim'            " implements some of TextMate's snippets features in Vim.
Plugin 'scrooloose/syntastic'             " Syntax checking hacks for vim.
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru, tag, etc finder.
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_tabpage_position  = 'a'
let g:ctrlp_working_path_mode = 'r'

if executable('ag')

	    let g:ctrlp_user_command = 'ag %s --smart-case --nogroup --hidden
		          \ --ignore .git
		          \ --ignore .svn
		          \ --ignore .hg
		          \ --ignore .DS_Store
		          \ --ignore __pycache__
		          \ --ignore "**/*.pyc"
		          \ -g ""'
endif
Plugin 'Shougo/neocomplcache.vim'         " Ultimate auto-completion system for Vim.
Plugin 'mhinz/vim-signify'                " Show a diff via Vim sign column.
Plugin 'suan/vim-instant-markdown'        " Instant Markdown previews from VIm!
Plugin 'tpope/vim-markdown'               " Vim Markdown runtime files
Plugin 'terryma/vim-expand-region'        " Select increasingly larger regions of text
Plugin 'easymotion/vim-easymotion'        " Vim motions on speed
Plugin 'scrooloose/nerdcommenter'         " Vim plugin for intensely orgasmic commenting
Plugin 'terryma/vim-multiple-cursors'     " True Sublime Text style multiple selections for Vim
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
Plugin 'vim-scripts/ShowTrailingWhitespace' " Detect unwanted whitespace at the end of lines.
Plugin 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
Plugin 'mileszs/ack.vim'                  " Vim plugin for the Perl module / CLI script 'ack'
Plugin 'fatih/vim-go'                     " Go development plugin for Vim
Plugin 'majutsushi/tagbar'                " Vim plugin that displays tags in a window, ordered by scope
map TT :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 0
Plugin 'severin-lemaignan/vim-minimap'    " A Sublime-like minimap for VIM
Plugin 'Shougo/vimproc.vim'               " Interactive command execution in Vim
Plugin 'Shougo/vimshell.vim'              " Powerful shell implemented by vim
Plugin 'sebdah/vim-delve'                 " Vim integration for Delve
Plugin 'colorizer'						  "show css color
Plugin 'vim-autopep8'                     "F8 to format
Plugin 'godlygeek/tabular'
Plugin 'vim-indent-object'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_filetype_whitelist = { 'python':1 }
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>j :YcmCompleter GoToDefinition<CR>

Plugin 'marijnh/tern_for_vim'
Plugin 'winmanager'
let g:winManagerWindowLayout='FileExplorer|TagList' " 设置我们要管理的插件
let g:persistentBehaviour=0 
"如果所有编辑文件都关闭了，退出vim
map wm :WMToggle<CR>



"每个插件都应该在这一行之前  
 
call vundle#end()            " required 
