" vim: foldmethod=marker :

"*****************
"  basic
"*****************
set encoding=utf-8
set filetype=unix
set number
set nobackup
set noswapfile
set noundofile
set title
set showcmd
set shellslash
set diffopt=vertical
set completeopt+=menuone
set completeopt-=preview
set helplang=ja
set laststatus=2
set statusline+=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
set clipboard+=unnamedplus,unnamed
set guioptions-=T
set ttyfast
set tabstop=4
set expandtab
set shiftwidth=4

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

nnoremap <M-h> :<C-u>help<Space><C-r><C-w><CR>

" F5キーでコマンド履歴を開く
" F6キーで検索履歴を開く
nnoremap <F5> q:
nnoremap <F6> q/
" q:、q/、q? は無効化
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>

nnoremap <C-g> g;
inoremap <silent> jj <ESC>
nmap <Esc><Esc> :noh<CR>

colorscheme desert

" 開いたファイルのディレクトリに自動移動
"set autochdir test

if has('win32')
     let g:python3_host_prog = 'C:/ProgramData/Anaconda3/envs/test_py36/python'
    " let g:python3_host_prog = 'C:/ProgramData/Anaconda3/envs/test_py37/python'
    " let g:python3_host_prog = 'C:/Users/hasif/AppData/Local/Programs/Python/Python38/python'
    let g:python_host_prog = 'C:/ProgramData/Anaconda3/envs/test_py27/python'
else
    let g:python3_host_prog = '/usr/bin/python3'
    let g:python_host_prog = '/usr/bin/python2'
endif

" tab ------------------------------------
nnoremap <silent> <C-l> :<C-u>tabnext<CR>
nnoremap <silent> <C-h> :<C-u>tabprevious<CR>
nnoremap <silent> <C-t> :<C-u>tabedit<CR>

" window ---------------------------------
" split Window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move Window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize Window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-


" like quickrun --------------------------
function! Exe()
    echo "my script run"
	let filename = expand('%:t')
	if stridx(filename, ".py") != -1
        !python %
    elseif  stridx(filename, ".jl") != -1
        !julia %
    else
		echo "not define filetype in my_script_run: "+filename
    endif
endfunction
command! Exe :call Exe()
nmap <F9> :Exe<CR>

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" set runtimepath+=C:\Users\hasif\.cache\dein\repos\github.com\Shougo\dein.vim

" let s:dein_home_dir  = expand('C:\Users\hasif\.cache\dein')
" let s:dein_repo_dir  = expand('C:\Users\hasif\.cache\dein\repos\github.com\Shougo\dein.vim')
" let s:toml_file      = expand('C:\Users\hasif\.config\dein\dein.toml')
" let s:toml_lazy      = expand('C:\Users\hasif\.config\dein\dein_lazy.toml')

let s:dein_home_dir  = expand('~/.cache/dein')
let s:dein_repo_dir  = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')
let s:toml_file      = expand('~/.config/dein/dein.toml')
let s:toml_lazy      = expand('~/.config/dein/dein_lazy.toml')

" if not exit dein.vim folder, git clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

" Required:
if dein#load_state(s:dein_home_dir)
    call dein#begin(s:dein_home_dir)
    call dein#add(s:dein_repo_dir)
    call dein#load_toml(s:toml_file, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

" if not installed, auto-install
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let g:user_emmet_leader_key='<C-y>'

"End dein Scripts-------------------------

" Required:
filetype plugin indent on
syntax enable

" let s:pyls_config = {'pyls': {'plugins': {
"     \   'pycodestyle': {'enabled': v:true},
"     \   'pydocstyle': {'enabled': v:false},
"     \   'pylint': {'enabled': v:false},
"     \   'flake8': {'enabled': v:true},
"     \   'jedi_definition': {
"     \     'follow_imports': v:true,
"     \     'follow_builtin_imports': v:true,
"     \   },
"     \ }}}
"
" if executable('pyls')
"     autocmd User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ 'workgroup_config': s:pyls_config,
"         \ })
"     autocmd FileType python call s:configure_lsp()
" endif
"
" function! s:configure_lsp() abort
"     setlocal omnifunc=lsp#complete
"     nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
"     nnoremap <buffer> gd :<C-u>LspDefinition<CR>
"     nnoremap <buffer> gD :<C-u>LspReferences<CR>
"     nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
"     nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
"     nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
"     vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
"     nnoremap <buffer> K :<C-u>LspHover<CR>
"     nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
"     nnoremap <buffer> <F2> :<C-u>LspRename<CR>
" endfunction


