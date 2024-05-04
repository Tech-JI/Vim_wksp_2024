let g:pathogen_blacklist = [ 'supertab' ]
execute pathogen#infect()

Helptags

set ts=2
set mouse=a
set nocompatible 
set autoindent    " always set autoindenting on
set textwidth=0   " Don't wrap words by default
set viminfo='20,\"50  " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50    " keep 50 lines of command line history

set ruler   " show the cursor position all the time
set cursorline 
"set cursorcolumn

set showmatch   " Show matching brackets.
set ignorecase    " Do case insensitive matching
set incsearch   " Incremental search
set hlsearch

set noexpandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

set autoread
set autowrite   " Automatically save before commands like :next and :make
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.to

set autochdir 
set splitbelow

" disable commented new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set nohidden "unused buffers cleaned up
:au FocusLost * :wa "autosave when loosing focus

" spellcheck
map <F12>  :call ToggleSpellChecking()<CR>

function! ToggleSpellChecking()
	if &spell == ""
		exe "setlocal spell spelllang=en"
		echo "Spell checking on (en)"
	elseif &spelllang == "en"
		exe "setlocal spell spelllang=fr"
		echo "Spell checking on (fr)"
	elseif &spelllang == "fr"
		exe "setlocal spell spelllang=en,fr"
		echo "Spell checking on (en,fr)"
	else
		exe "setlocal nospell"
		echo "Spell checking off"
	endif
endfunction

" dark/light switch
map <F11>  :call ToggleDarkLight()<CR>
"
function! ToggleDarkLight()
	if &background == "dark"
		exe "set background=light"
		exe "colorscheme PaperColor"
	else
		exe "set background=dark"
		exe "colorscheme wombat256mod"
	endif
endfunction 

" lightline
set t_Co=256
set noshowmode " hide -- INSERT -- at bottom

let g:lightline = {
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            [ 'gitbranch', 'githunks', 'readonly']],
  \   'right': [['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'trailing', 'lineinfo'],
  \             ['percent'],
  \             ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_ok': 'lightline#ale#ok',
  \   'trailing': 'lightline#trailing_whitespace#component',
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \   'trailing': 'error',
  \   'buffers': 'tabsel'
  \ },
  \ 'component_function': {
  \   'githunks': 'LightlineGitGutter',
	\   'gitbranch': 'gitbranch#name',
  \ }
  \ }

let g:lightline#bufferline#unicode_symbols  = 1
let g:lightline#trailing_whitespace#indicator = '•'

function! LightlineGitGutter()
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction

" light color for courses
if $trxvt == 1
	let g:lightline.colorscheme='PaperColor'
	set background=light
	colorscheme PaperColor
else
	let g:lightline.colorscheme='wombat'
	set background=dark
	colorscheme wombat256mod
endif

" supertab (tab completion)
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:SuperTabClosePreviewOnPopupClose = 1

map <A-Right> <ESC>:tabnext<CR>
map <A-Left> <ESC>:tabprev<CR>
imap <A-Right> <ESC>:tabnext<CR>
imap <A-Left> <ESC>:tabprev<CR>

let g:gutentags_ctags_tagfile = '.tags'

" gitgutter
set signcolumn=no
let g:gitgutter_signs = 0
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1


"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
"                   \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
map <F1> 1gt
imap <F1> <C-O>1gt
map <F2> 2gt
imap <F2> <C-O>2gt
map <F3> 3gt
imap <F3> <C-O>3gt
map <F4> 4gt
imap <F4> <C-O>4gt
map <F5> 5gt
imap <F5> <C-O>5gt
map <F6> 6gt
imap <F6> <C-O>6gt
map <F7> 7gt
imap <F7> <C-O>7gt
map <F8> 8gt
imap <F8> <C-O>8gt
map <F9> 9gt
imap <F9> <C-O>9gt
map <F10> 10gt
imap <F10> <C-O>10gt

" use ESC to exit term mode
tnoremap <Esc> <C-\><C-n>
" insert mode when entering term
autocmd TermOpen * startinsert
"no prompt when exiing term
autocmd TermClose * call feedkeys("i")
map <F10> :10 split +terminal<CR>
imap <F10> <C-O> :10 split +terminal<CR>


"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" disable tab for ultisnip 
let g:UltiSnipsExpandTrigger = "<c-tab>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
"inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

let g:coc_snippet_next = '<tab>'

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
:let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" COC 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
		highlight link TabNum Special
endif

" window name in tmux
"autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
"autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * let &titlestring = '%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\"). })%)'
"%(\ %a%)%(\ --\ %{v:servername}%)'
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)%(\ --\ %{v:servername}%)
set title

"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:SuperTabClosePreviewOnPopupClose = 1

" vimtex needs that here (2020/9/14)
let g:tex_flavor = 'latex'

" nerdtree
if $trxvt == 1
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
	map <C-n> :NERDTreeToggle<CR>
	let g:NERDTreeNaturalSort = 1
endif

" markdown-preview needs that here
"let g:mkdp_auto_start = 1
let g:mkdp_browser = 'qutebrowser'

vnoremap <leader>lv "+y <bar> :!wmctrl -s 4 <bar> :!xdotool mousemove 10 30 click 1 <bar> :!xdotool key ctrl+v Return<CR><CR>
