if !exists('g.mm_accounts')
  " Crappy defaults
    echohl ErrorMsg
    echom "Horrible default account names have been loaded since you did not set g.mmAccounts to a list of accounts"
    echohl None
  let g:mm_accounts = ['Pants', 'Rands', 'Duece', 'Spigot']
endif

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
    if exists('g:mm_nohistorymode')
      normal ggdGi
    else
      normal o
    endif
    startinsert
  else
    echohl ErrorMsg | echom "No muck set! Use <leader># to set" | echohl None
  endif
endfunction

function! s:SetupAccounts(accounts)
  let l:number = 1
  for account in a:accounts
    execute "map <Leader>".l:number." :call SetMuck(".account.")<CR>"
    let l:number += 1
  endfor
endfunction

function! s:SetupMM()
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

  call s:SetupAccounts(g:mm_accounts)
endfunction

au BufRead,BufNewFile mucking_around call s:SetupMM()
