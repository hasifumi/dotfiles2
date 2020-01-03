nnoremap <silent> <F11>  :<C-u>QuickRun<CR>
nnoremap <silent> ,qr  :<C-u>QuickRun<CR>

let g:quickrun_config = {
\ "python" : {
\   "command" : "C:\ProgramData\Anaconda3\envs\test_py36\python",
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "cp932",
\    },
\}


" \ "_" : {
" \   "runner" : "vimproc",
" \   "runner/vimproc/updatetime": 60 ,
" \    },
