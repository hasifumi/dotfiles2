let g:coc_disable_startup_warning = 1

inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
nmap <space>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> <space><space> :<C-u>CocList<cr>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" set pumblend=10
