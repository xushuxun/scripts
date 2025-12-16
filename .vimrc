" =============================================================
" 0. 兼容性与基本行为
" =============================================================
set nocompatible            " 关闭 Vi 兼容模式
filetype plugin indent on   " 根据文件类型加载对应插件与缩进规则

" =============================================================
" 1. 外观与界面
" =============================================================
set number                  " 显示行号
set cursorline              " 高亮当前行
set showmatch               " 光标在括号上短暂跳转到匹配的括号
set hlsearch                " 高亮搜索结果
set incsearch               " 输入搜索词时即时预览
set ignorecase smartcase    " 搜索时忽略大小写，但有大写字母时区分
set laststatus=2            " 总是显示状态栏
set cmdheight=2             " 命令行高度（避免提示被覆盖）
colorscheme habamax         " 可换成 desert、slate、elflord 等

" =============================================================
" 2. 编辑体验
" =============================================================
set expandtab               " Tab 转空格
set tabstop=4               " 一个 Tab 显示为 4 个空格
set shiftwidth=4            " 自动缩进为 4 个空格
set autoindent              " 继承上一行缩进
set smartindent             " 根据语法智能缩进（C 族语言有效）
set backspace=indent,eol,start " 退格键能删除缩进、换行、插入起始
set clipboard=unnamedplus   " 与系统剪贴板互通（+ 寄存器）
set mouse=a                 " 在所有模式下启用鼠标
set scrolloff=5             " 光标上下最少保留 5 行
set sidescrolloff=5
set wrap                    " 软换行（长行显示到下一屏）
set linebreak               " 只在单词边界换行
set showbreak=↪             " 换行符前显示 ↪ 提示

" =============================================================
" 3. 文件与备份
" =============================================================
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,default,latin1
set nobackup                " 不保留备份文件 xxx~
set noswapfile              " 不产生 .swp
set undofile                " 持久撤销（~/.vim/undo）
set undodir=~/.vim/undo
if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
endif

" =============================================================
" 4. 基础快捷键（不依赖插件）
" =============================================================
" 4.1 保存/退出
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" 4.2 分屏导航
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 4.3 快速 Esc（终端/插入模式）
inoremap jj <Esc>

" 4.4 复制整行到系统剪贴板
nnoremap <leader>y "+yy
vnoremap <leader>y "+y

" 4.5 粘贴系统剪贴板
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" 4.6 取消搜索高亮
nnoremap <silent> <leader><space> :nohlsearch<CR>

" =============================================================
" 5. Leader 键
" =============================================================
let mapleader=" "           " 空格键作为 <leader>，按键更顺手

" =============================================================
" 6. 插件管理器（可选）
" =============================================================
" 若后续想装插件，推荐使用 vim-plug：
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" 在 .vimrc 末尾追加：
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"
" 保存后进入 Vim 执行 :PlugInstall