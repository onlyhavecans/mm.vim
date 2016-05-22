function! SetMuck(user)
  let w:muck = a:user
  echom 'Outfile set to: '.w:muck
endfunction

function! ShowMuck()
  if exists("w:muck")
    echom "Current muck is: ".w:muck
  else
    echom "No muck set! Use <leader># to set"
  endif
endfunction

function! SendToMuck()
  if exists("w:muck")
    execute ".w >> ".w:muck."/in"
    normal o
    startinsert
  else
    echohl ErrorMsg | echo "No muck set! Use <leader># to set" | echohl None
  endif
endfunction

function! s:SetupMUCK()
  " clean up behavior to be more input box like
  let g:powerline_loaded = 1
  colorscheme default
  syntax off
  filetype off
  set laststatus=0
  set nonumber
  set wrap

  map <leader>m :call SendToMuck()<CR>
  imap <leader>m <ESC>:call SendToMuck()<CR>

  map <leader>1 :call SetMuck("pants")<CR>
endfunction

au BufRead,BufNewFile mucking_around call s:SetupMUCK()
