set tabstop=4 softtabstop=4
set mouse=a
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set hidden
set noerrorbells
set nowrap
set hls is
set signcolumn=yes
set nocompatible
filetype plugin indent on
syntax on 

call plug#begin('~/vim/plugged')
Plug 'joshdick/onedark.vim' 
Plug 'vim-scripts/AutoClose'
Plug 'mg979/vim-visual-multi'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale' 
Plug 'kana/vim-smartinput'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vimwiki/vimwiki'
"Plug 'mhinz/vim-startify'
"Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf.vim'
Plug 'adelarsq/vim-matchit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'
"Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
" Plug 'tc50cal/vim-terminal'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'instant-markdown/vim-instant-markdown'
Plug 'rust-lang/rust.vim'
Plug 'wsdjeg/vim-assembly'
call plug#end()

"vimwiki path"
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]

"colorscheme"
colorscheme molokai

hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=none 
hi LineNr term=bold cterm=NONE ctermfg=cyan ctermbg=NONE gui=NONE guifg=NONE guibg=NONE 

"map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>"

"FILES RUN"
autocmd FileType python nnoremap <F9> :w <CR> :!python3 %<CR>
autocmd FileType c nnoremap <F9> :w <CR> :!gcc % -o %< && ./%< -g<CR>
"autocmd FileType c nnoremap <F8> :w <CR> :!gcc % -o %< && ./%< -s<CR>"
autocmd FileType cpp nnoremap <F9> :w <CR> :!g++ -o %:r % <CR> :!./%:r < <CR>
autocmd FileType rs nnoremap <F9> :w <CR> :!cargo run<CR>
autocmd FileType rs nnoremap <F8> :w <CR> :!rustc % && ./%<<CR>

"Moving between multiple sessions mapping"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k 
map <C-l> <C-w>l

nmap <C-f> :NERDTreeToggle<CR>
" nmap <C-m> :MaximizerToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

autocmd VimEnter * NERDTree

"CLOSE TAG OPTIONS"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
 inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
             \ <SID>check_back_space() ? "\<TAB>" :
                   \ coc#refresh()
                   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

                   function! s:check_back_space() abort
                     let col = col('.') - 1
                       return !col || getline('.')[col - 1]  =~# '\s'
                       endfunction

                       " Use <c-space> to trigger completion.
                       inoremap <silent><expr> <c-space> coc#refresh()

" Enable/Disable autostart for instant-markdown
let g:instant_markdown_autostart = 0
nnoremap <F2> :let g:instant_markdown_autostart=1
