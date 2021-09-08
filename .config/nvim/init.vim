set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'elixir-editors/vim-elixir'
call plug#end()

let mapleader=",,"

" general
set number
set showcmd
set ignorecase
set smartcase
set hlsearch
set softtabstop=2
set shiftwidth=2
set expandtab
set scrolloff=10

" moving around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>h :FSSplitLeft<CR>
nnoremap [1;5C <C-W>[1;2C
nnoremap [1;5D <C-W>[1;2D

" moving around tabs
nnoremap <C-N> :tabprevious<CR>
nnoremap <C-M> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

command OpenConfig lua vim.api.nvim_command('tabe ~/.config/nvim/init.vim')

lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.gopls.setup{}

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
