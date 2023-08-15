call plug#begin(stdpath('config').'/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'p00f/clangd_extensions.nvim', {'for': ['c', 'cpp']}
call plug#end()

lua <<EOF
require('usermod')
EOF
