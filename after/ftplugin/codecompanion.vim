" Jump between markdown headers (ATX style)
function! s:JumpHeader(forward)
    if a:forward
        call search('^#', 'W')
    else
        call search('^#', 'bW')
    endif
endfunction

nnoremap <silent><buffer> ]h :call <sid>JumpHeader(1)<cr>
onoremap <silent><buffer> ]h :call <sid>JumpHeader(1)<cr>
xnoremap <silent><buffer> ]h :call <sid>JumpHeader(1)<cr>
nnoremap <silent><buffer> [h :call <sid>JumpHeader(0)<cr>
onoremap <silent><buffer> [h :call <sid>JumpHeader(0)<cr>
xnoremap <silent><buffer> [h :call <sid>JumpHeader(0)<cr>
