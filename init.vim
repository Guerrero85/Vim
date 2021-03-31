call plug#begin('~/.local/share/nvim/plugged')


"----------themes----------------------------------------
" Tema principal instalado 'sainnhe/sonokai'
"Plug 'phanviet/vim-monokai-pro'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

"---Plugin para aspecto visual----------------------------
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/c.vim'
Plug 'stanangeloff/php.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'


"-------------functionality------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'KabbAmine/vCoolor.vim'
Plug 'vim-python/python-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'

"----Functionality Plugins Web---------------------------
Plug 'mattn/emmet-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"-----Plugins para C# (csharp)----------------------------

Plug 'w0rp/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'OmniSharp/omnisharp-vim'
"---------------------------------------------------------


"code modification
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'


call plug#end()

"----Configuracion Inicio-------
syntax enable
set number
set expandtab
set rnu
set sw=2
set nowrap
set ignorecase
set numberwidth=1
set showcmd
set showmatch
set cursorline
set encoding=utf-8
set clipboard=unnamedplus
set colorcolumn=110
set noshowmode

"---------------------------------

highlight ColoColumn ctermbg=0 guibg=lightgrey
set termguicolors


" Activa tecla Lider
let mapleader = " "

" Bloque Flechas para modo Visualizar
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap <leader>w :w<CR>

" Moverse al buffer siguiente con <líder> + k
nnoremap <leader>k :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

"crear una nueva ventana
nnoremap <leader>t :tabe<CR>




"---------Configuracion de OmniSharp-----------------------------


" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


" ALE
let g:ale_linters = { 'cs' : ['OmniSharp'] }
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'


" OmniSharp
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp[/\\]', 'obj[/\\]', '\.nuget[/\\]' ]
let g:OmniSharp_fzf_options = { 'down': '10' }

augroup csharp_commands
    autocmd!
    autocmd FileType cs nmap <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <buffer> <Leader><Space> <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <buffer> <Leader><Space> <Plug>(omnisharp_code_actions)
    autocmd FileType cs nmap <buffer> <F2> <Plug>(omnisharp_rename)
    autocmd FileType cs nmap <buffer> <Leader>cf <Plug>(omnisharp_code_format)
    autocmd FileType cs nmap <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <buffer> <Leader>dc <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <buffer> <Leader>cc <Plug>(omnisharp_global_code_check)
    autocmd FileType cs nmap <buffer> <Leader>rt <Plug>(omnisharp_run_test)
    autocmd FileType cs nmap <buffer> <Leader>rT <Plug>(omnisharp_run_tests_in_file)
    autocmd FileType cs nmap <buffer> <Leader>ss <Plug>(omnisharp_start_server)
    autocmd FileType cs nmap <buffer> <Leader>sp <Plug>(omnisharp_stop_server)
    autocmd FileType cs nmap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs imap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd BufWritePre *.cs :OmniSharpCodeFormat

    " vim-better-whitespace
    autocmd FileType cs let g:strip_whitespace_on_save = 1
    autocmd FileType cs let g:strip_whitespace_confirm = 0
augroup END


"----------------------------------------------------------


"Configuration of FZF
let g:fzf_preview_window = 'right:40%'
nnoremap <c-o> :Files<CR>
nnoremap <c-g> :GitFiles<CR>

nmap <Leader><Tab> <Plug>(fzf-maps-n)
nmap <Leader>p :Files<CR>

"Configuration NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" use current git repo/file director with ctrl p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0


let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'


"easymotion
nmap <leader>s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

"theme monokai-pro
"colorscheme monokai_pro
"let g:lightline = {
"     \ 'colorscheme': 'monokai_pro',
"      \ }




" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif


let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight-community'
colorscheme material


"Mapeo de la barra de estado airline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline_powerline_fonts = 1 " Modifica los separadores para que tengan forma de triangulos
let g:airline_theme='tomorrow'



"-------Configuracion de COC.VIM-----------------------------
