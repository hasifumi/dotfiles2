"echo 'loaded defx setting'
nnoremap <silent> ,vf  :Defx<CR>
call defx#custom#option('_', {
    \ 'show_ignored_files': 1,
    \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
" Define mappings
    nnoremap <silent><buffer><expr> <CR>  defx#do_action('open')
    nnoremap <silent><buffer><expr> l     defx#do_action('open')
    nnoremap <silent><buffer><expr> c     defx#do_action('copy')
    nnoremap <silent><buffer><expr> m     defx#do_action('move')
    nnoremap <silent><buffer><expr> p     defx#do_action('paste')
    nnoremap <silent><buffer><expr> q     defx#do_action('quit')
    nnoremap <silent><buffer><expr> E     defx#do_action('open', '160vsplit')
    nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N     defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d     defx#do_action('remove')
    nnoremap <silent><buffer><expr> r     defx#do_action('rename')
    nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
endfunction
