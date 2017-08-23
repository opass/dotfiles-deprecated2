set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plug 'chriskempson/base16-vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install --all'}
Plug 'junegunn/fzf.vim'

Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
" Plug 'majutsushi/tagbar'
Plug 'ramitos/jsctags'
Plug 'jiangmiao/auto-pairs'
" for auto detect indentation
Plug 'tpope/vim-sleuth'

call plug#end()

" All of your Plugins must be added before the following line
"
"
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=4
set shiftwidth=4  " when pressing enter in {|}, it will indent 4
set expandtab
set nu

" set vim to support 256 color schme
set t_Co=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" 顯示空白和tab
" set list會用下方字元顯示tab和空白
" set nolist恢復正常
set listchars=tab:>-,space:.

set hlsearch  " Search highlight

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/ " Show trailing white space
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

let g:airline_powerline_fonts = 1
