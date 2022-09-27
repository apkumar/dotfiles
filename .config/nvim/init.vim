call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'elixir-editors/vim-elixir'
Plug 'github/copilot.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
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
nnoremap <CR> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

command OpenConfig lua vim.api.nvim_command('tabe ~/.config/nvim/init.vim')

" LSP
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.gopls.setup{}
lua require'lsp_callbacks'

nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

nnoremap <C-P>      <cmd>Telescope git_files show_untracked=true<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
tnoremap <Esc> <C-><C-n>

" Telescope

lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next"
      }
    }
  },
}
EOF

set tw=80

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
