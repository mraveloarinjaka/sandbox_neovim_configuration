call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'p00f/clangd_extensions.nvim', {'for': ['c', 'cpp']}
call plug#end()

lua <<EOF
require('usermod')
EOF
