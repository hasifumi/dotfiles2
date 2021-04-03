nnoremap <silent> <F11>  :<C-u>QuickRun<CR>
nnoremap <silent> ,qr  :<C-u>QuickRun<CR>

let g:quickrun_config = {
\ "_" : {
\   "runner" : "vimproc",
\   "runner/vimproc/updatetime" : 40,
\   "outputter/buffer/split" : "botright",
\   "outputter/buffer/close_on_empty" : 1,
\   "hook/close_buffer/enable_exit" : 1,
\    },
\}

