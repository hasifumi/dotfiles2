nnoremap ,js  :<c-u>VimShellPop<CR>
nnoremap ,jj  :<c-u>VimShellPop<CR>
nnoremap <F7>  :<c-u>VimShellPop<CR>
nnoremap ,jsf  :<c-u>VimShell<CR>
"tnoremap <ESC>  <C-\><C-n>

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'

if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."% "
endif

" Initialize execute file list.
let g:vimshell_execute_file_list = {}
call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

autocmd FileType vimshell call s:my_defin()
function! s:my_defin()
  call vimshell#altercmd#define('g', 'git')
  call vimshell#altercmd#define('i', 'iexe')
  call vimshell#altercmd#define('l', 'll')
  call vimshell#altercmd#define('ll', 'ls -l')
  call vimshell#hook#add('chpwd', 'my_chpwd', 'MyChpwd')
endfunction

"function! MyChpwd(args, context)
"  call vimshell#execute('ls')
"endfunction

"autocmd FileType int-* call s:interactive_settings()
"function! s:interactive_settings()
"endfunction
