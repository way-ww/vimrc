" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
"bundle配置
filetype off
set nocompatible
"设置Vundle的运行路径
set rtp+=/opt/bundle/Vundle.vim
"设置插件的安装路径,vundle插件起始标志
call vundle#begin('/opt/bundle')
"让vundle管理插件版本
Plugin 'VundleVim/Vundle.vim'
"添加nerdtree插件
Plugin 'scrooloose/nerdtree'
"自动缩进
"Plugin 'vim-scripts/indentpython.vim'
"Powerline状态栏
Plugin 'Lokaltog/vim-powerline'
"输入法修复esc
Plugin 'lilydjwg/fcitx.vim'
"自动补全括号和引号
Plugin 'jiangmiao/auto-pairs'
"细垂直线显示缩进
Plugin 'Yggdroot/indentLine'
"python pep8风格　需要先pip install autopep8
Plugin 'tell-k/vim-autopep8'
"vim 主题material my favorite
Plugin 'hzchirs/vim-material'
"不同颜色括号
Plugin 'kien/rainbow_parentheses.vim'
"python 代码补全
Plugin 'maralla/completor.vim'
"markdown渲染阅读，预览
Plugin 'iamcco/markdown-preview.nvim'
"markdown语法高亮 /opt/vim/bundle/vim-markdown/syntax/markdown.vim     mkdLineBreak = Conceal
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"你的所有插件需要在下面这行之前
call vundle#end()
filetype plugin indent on
"根据不同类型文件记载对应插件
filetype plugin on

"对齐风格配置
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
"vim-material配色方案
" Light
set background=light
colorscheme vim-material
" 在处理未保存或只读文件的时候，弹出确认
set confirm             
"缩进指示线"
let g:indentLine_char='┊'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 239
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1
"启用自动缩进
set autoindent
set smartindent
"autopep8设置"<F8>使用自动格式化pep8风格
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	if &filetype == 'sh'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: way") 
        call append(line(".")+2, "\# mail: ww875749864@outlook.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\# Description:  ")
        call append(line(".")+5, "\#########################################################################") 
        call append(line(".")+6, "\#!/bin/bash") 
        call append(line(".")+7, "") 

	elseif &filetype == 'python'
        call setline(1,"########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: way") 
        call append(line(".")+2, "\# mail: ww875749864@outlook.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\# Description:")
        call append(line(".")+5, "\#########################################################################") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: way") 
        call append(line(".")+2, "    > Mail: ww875749864@outlook.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, "    > Description:  ") 
        call append(line(".")+5, " ************************************************************************/") 
        call append(line(".")+6, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+7, "#include<iostream>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif

    if &filetype == 'c'
        call append(line(".")+7, "#include<stdio.h>")
        call append(line(".")+8, "")
    endif

endfunc 

"设置分割窗口
set splitbelow
set splitright
"设置窗口移动快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"设置按F2启动NerdTree
map <F2> :NERDTreeToggle<CR>
"NERDTree配置
let NERDChristmasTree=1       "显示增强
let NERDTreeAutoCenter=1      "自动调整焦点
let NERDTreeShowFiles=1       "显示文件
let NERDTreeShowLineNumbers=1 "显示行号
let NERDTreeHightCursorline=1 "高亮当前文件
let NERDTreeShowHidden=0      "显示隐藏文件
let NERDTreeMinimalUI=0       "不显示'Bookmarks' label 'Press ? for help'
let NERDTreeWinSize=31        "窗口宽度
"隐藏目录树种的.pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"设置可以删除缩进
set backspace=2
"设置utf-8编码
set encoding=utf-8
"设置Ｃ语言自动对齐
set cindent
"开启设置语法高亮
syntax on
syntax enable
set expandtab
"侦测不同文件类型
"filetype on
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" 高亮显示搜索结果
set hlsearch
"esc键清除高亮搜索
nnoremap <C-L> :nohl<cr>
"指定配色方案为256
set t_Co=256 
"设置可以在VIM使用鼠标
set mouse=v 
"设置TAB宽度
set tabstop=4 
"设置历史记录条数
set history=500 
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"记忆上次修改的位置
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
"设置折行
set wrap
" 折行时，以单词为界，以免切断单词
set linebreak
" 折行后的后续行，使用与第一行相同的缩进
set breakindent

"<F5>自动执行python代码
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

"maralla/completor 补全设置tab自动补全
let g:completor_min_chars=3 "增加自动补全提示的阀值
let g:completor_python_binary = '/usr/bin/python'
let python_highlight_all = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"markdown渲染阅读
let g:mkdp_path_to_chrome="/usr/bin/google-chrome-stable"
let g:mkdp_auto_close=0
map <F7> :MarkdownPreview<CR>
map <F6> :MarkdownPreviewStop<CR>

let g:vim_markdown_folding_disabled = 1 
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter=1
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0

