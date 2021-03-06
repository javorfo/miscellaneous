set number
set autoindent 
set ignorecase 
set tabstop=4
set shiftwidth=4 
set smarttab
set softtabstop=4
set mouse=a 
set hidden
set splitright 
set splitbelow 
syntax on 

let mapleader = " "
nnoremap <SPACE> <Nop>

call plug#begin()
Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'junegunn/fzf.vim' 
Plug 'javorfo/vim-libertango' 
Plug 'javorfo/vim-minimaline' 
Plug 'javorfo/vim-vimain' 
Plug 'javorfo/vim-wildcat'  
Plug 'javorfo/vim-hevimgway'  
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
set encoding=UTF-8
call plug#end()

if has('termguicolors')
	set termguicolors
endif

colorscheme libertango
let g:minimaline_theme = 2
		
so /path/to/.config/nvim/mappings.vim	

lua << EOF
require'lspconfig'.vimls.setup{}

require'lspconfig'.kotlin_language_server.setup{
	cmd = {
		"/path/to/kotlin-language-server-main/server/build/install/server/bin/kotlin-language-server"
	}
}

require'lspconfig'.sumneko_lua.setup {
  cmd = {
  	"path/to/lua-language-server/bin/lua-language-server"
  }
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("/path/to/workspace", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
EOF
