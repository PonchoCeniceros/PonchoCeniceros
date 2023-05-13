"              _   _                              __ _           
"  _ __   __ _| |_(_)_   _____    ___ ___  _ __  / _(_) __ _ ___ 
" | '_ \ / _` | __| \ \ / / _ \  / __/ _ \| '_ \| |_| |/ _` / __|
" | | | | (_| | |_| |\ V /  __/ | (_| (_) | | | |  _| | (_| \__ \
" |_| |_|\__,_|\__|_| \_/ \___|  \___\___/|_| |_|_| |_|\__, |___/
"                                                      |___/     
"
"
"
syntax on                 " Turn syntax highlighting on.
set number                " Add numbers to each line on the left-hand side.
set relativenumber        " show relative numbers to each line on the left-hand side.
set mouse=a               " Copying text outside of Vim.
set cursorline            " Highlight cursor line underneath the cursor horizontally.
set shiftwidth=2          " Set shift width to 2 spaces.
set tabstop=1             " Set tab width to 2 columns.
set expandtab             " Use space characters instead of tabs.
set nobackup              " Do not save backup files.
set scrolloff=10          " Do not let cursor scroll below or above N number of lines when scrolling.
set nowrap                " Do not wrap lines. Allow long lines to extend as far as the line goes.
set incsearch             " While searching though a file incrementally highlight matching characters as you type.
set ignorecase            " Ignore capital letters during search.
set smartcase             " Override the ignorecase option if searching for capital letters.
                          " This will allow you to search specifically for capital letters.
set showcmd               " Show partial command you type in the last line of the screen.
set showmode              " Show the mode you are on the last line.
set showmatch             " Show matching words during a search.
set hlsearch              " Use highlighting when doing a search.
set history=1000          " Set the commands to save in history default number is 20.
set wildmenu              " Enable auto completion menu after pressing TAB.
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.
set laststatus=2          " stuff related to lightline
set termguicolors         " color gived by terminal, not proper colors
set noshowmode            " magic stuff     
set encoding=UTF-8        " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
                          " unicode characters in the file autoload/float.vim
set updatetime=100        " Update time for completion response (default is 4000 ms = 4 s)
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,.DS_Store,.keep 
set clipboard=unnamed                                                                        
set wildignore=*/node_modules/* " ignore node_modules folder when use vimgrep"
"
"
"        _             _           
"  _ __ | |_   _  __ _(_)_ __  ___ 
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/             
"
"
"
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'                                      " [1] THEME
Plug 'olimorris/onedarkpro.nvim'                            " 
Plug 'maximbaz/lightline-ale'                               " 
Plug 'itchyny/lightline.vim'                                " 
Plug 'yggdroot/indentline'                                  " 
Plug 'preservim/nerdcommenter'                              " [2] COMMENTS
Plug 'scrooloose/nerdtree'                                  " [3] TREE SIDEBAR
Plug 'ryanoasis/vim-devicons'                               " 
Plug 'nvim-lua/plenary.nvim'                                " [4] FINDER
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.0'}      " 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " 
Plug 'neoclide/coc.nvim', {'branch': 'release'}             " [5] COMPLETION AND TYPING
Plug 'jiangmiao/auto-pairs'                                 " 
Plug 'alvan/vim-closetag'                                   " 
Plug 'SirVer/ultisnips'                                     " 
Plug 'pangloss/vim-javascript'                              " [6] WEB DEVELOPMENT
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
"
"
"  _ __ ___   __ _ _ __  ___ 
" | '_ ` _ \ / _` | '_ \/ __|
" | | | | | | (_| | |_) \__ \
" |_| |_| |_|\__,_| .__/|___/
"                 |_|        
"
"
let mapleader=" "
"
" quit, save and save & quit shortcuts
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
"
" semicolon
nnoremap <Leader>, $a;<Esc>
"
" tab handling shorcuts
nnoremap <Leader>z :tabe .<CR>
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>
"
" side bar
map <silent> nt :NERDTreeFind<CR>
"
" GoTo code navigation.
" NOTE: You can set 'coc.preferences.jumpCommand': 'tabe' in your
" coc-settings.json (:CocConfig), this will open in vim tabs.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
"
"
"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"
" NOTE: Toggles the comment state of the selected line(s). If the topmost selected
" line is commented, all selected lines are uncommented and vice versa.
" [count]<leader>c<space> |NERDCommenterToggle|
"
" <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
" <BS>  : Delete brackets in pair
" <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
" <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
" <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
" <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable no select by
" `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin
" before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
"
"  _   _                         
" | |_| |__   ___ _ __ ___   ___ 
" | __| '_ \ / _ \ '_ ` _ \ / _ \
" | |_| | | |  __/ | | | | |  __/
"  \__|_| |_|\___|_| |_| |_|\___|
"            
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
"                                           _
"   ___ ___  _ __ ___  _ __ ___   ___ _ __ | |_ ___ 
"  / __/ _ \| '_ ` _ \| '_ ` _ \ / _ \ '_ \| __/ __|
" | (_| (_) | | | | | | | | | | |  __/ | | | |_\__ \
"  \___\___/|_| |_| |_|_| |_| |_|\___|_| |_|\__|___/
"                                                   
"
let g:NERDCreateDefaultMappings = 1  " Create default mappings
let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1        " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'      " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1         " Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 1      " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1    " Enable NERDCommenterToggle to check all selected lines is commented or not 
"
"  _                       _     _      _                
" | |_ _ __ ___  ___   ___(_) __| | ___| |__   __ _ _ __ 
" | __| '__/ _ \/ _ \ / __| |/ _` |/ _ \ '_ \ / _` | '__|
" | |_| | |  __/  __/ \__ \ | (_| |  __/ |_) | (_| | |   
"  \__|_|  \___|\___| |___/_|\__,_|\___|_.__/ \__,_|_|   
"
"
let NERDTreeWinSize = 30      " Initial NERDTree width
let NERDTreeQuitOnOpen = 1    " Close NERDtree when files was opened
let NERDTreeShowBookmarks = 1 " Show NERDTree bookmarks
let NERDTreeDirArrows = 0     " Display arrows instead of ascii art in NERDTree
let NERDTreeChDirMode = 2     " Change current working directory based on root directory in NERDTree
let NERDTreeMinimalUI = 1     " Start NERDTree in minimal UI mode (No help lines)
let NERDTreeShowHidden = 1    " Show hidden files
let NERDTreeIgnore=[
  \ '\.git$', '\.jpg$', '\.mp4$', '\.ogg$',
  \ '\.iso$', '\.pdf$', '\.pyc$', '\.odt$',
  \ '\.png$', '\.gif$', '\.db$', '\.DS_Store$','\.keep$']
let g:webdevicons_enable_nerdtree = 1           " Can be enabled or disabled
let g:webdevicons_conceal_nerdtree_brackets = 1 " whether or not to show the nerdtree brackets around flags
"
"               _           _                _                                  _   
" __      _____| |__     __| | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ 
" \ \ /\ / / _ \ '_ \   / _` |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
"  \ V  V /  __/ |_) | | (_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
"   \_/\_/ \___|_.__/   \__,_|\___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
"                                                   |_|                             
"
let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_colorful_config = 1 " default 0
"                            _      _   _             
"   ___ ___  _ __ ___  _ __ | | ___| |_(_) ___  _ __  
"  / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \ 
" | (_| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
"  \___\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
"                     |_|
"
"
" You can add extension names to the g:coc_global_extensions variable,
" and coc will install the missing extensions after coc.nvim service started.
let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-css', 'coc-pyright']
"
" closetag configurations
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx' " filenames like *.xml, *.html, *.xhtml, ...
                                                               " These are the file extensions where this plugin is enabled.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'               " filenames like *.xml, *.xhtml, ...
                                                               " This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'           " filetypes like xml, html, xhtml, ...
                                                               " These are the file types where this plugin is enabled.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'                   " filetypes like xml, xhtml, ...
                                                               " This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_emptyTags_caseSensitive = 1                     " integr value [0|1]
                                                               " This will make the list of non-closing tags case-sensitive
                                                               " (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_shortcut = '>'                                  " Shortcut for closing tags, default is '>'
let g:closetag_close_shortcut = '<leader>>'                    " Add > at current position without closing the
                                                               " current tag, default is ''
filetype plugin indent on                                      " required
let g:neoformat_try_node_exe = 1                               " 
let g:AutoPairsMapCR = 0                                       " disable <CR> for autopairs 
"
" Use tab for trigger completion with characters ahead and navigate.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Use K to show documentation in preview window.
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>c"
let g:UltiSnipsJumpBackwardTrigger="<leader>x"
