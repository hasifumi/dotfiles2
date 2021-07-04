" bookmark
nnoremap <silent>,db   :<C-u>Denite -direction=topleft bookmark<CR>
" most recently used files
nnoremap <silent>,dm   :<C-u>Denite -direction=topleft file_mru<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <ESC>    denite#do_map('quit')
  nnoremap <silent><buffer><expr> <CR>     denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d        denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p        denite#do_map('toggle_auto_action', 'preview')
  nnoremap <silent><buffer><expr> i        denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>  denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> s        denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v        denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> ..       denite#do_map('move_up_path')
endfunction

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
endif

nnoremap <silent> <C-p> :<C-u>Denite file buffer file:new<CR>
" nnoremap <silent> <C-p> :<C-u>Denite file/rec<CR>

nnoremap <silent> // :<C-u>Denite -buffer-name=search -auto-action=highlight line<CR>
nnoremap <silent> * :<C-u>DeniteCursorWord -buffer-name=search -auto-action=highlight line<CR>

" autocmd FileType denite-filter call s:denite_filter_my_settings()
" function! s:denite_filter_my_settings() abort
"   imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
" endfunction
