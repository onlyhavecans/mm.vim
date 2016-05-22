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
    let l:infile = expand("~/muck/".w:muck."/in")
    execute ".w >> ".l:infile
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

function! s:CleanupBehavior()
  " clean up behavior to be more input box like
  let g:powerline_loaded = 1
  colorscheme default
  syntax off
  filetype off
  set laststatus=0
  set nonumber
  set wrap
endfunction

function! s:SetupAccounts(accounts)
  let l:number = 1
  for account in a:accounts
    execute "map <Leader>".l:number." :call SetMuck('".account."')<CR>"
    let l:number += 1
  endfor
endfunction

function! s:SetupMM()
  " Warn about crappy defaults if they didn't set the important stuff
  if !exists('g:mm_accounts')
    " Crappy defaults
    echohl ErrorMsg
    echom "You didn't set g:mm_accounts for mm.vim so horrible defaults are loaded"
    echohl None
    let g:mm_accounts = ['Pants', 'Rands', 'Duece', 'Spigot']
  endif

  call s:CleanupBehavior()

  map <leader>m :call SendToMuck()<CR>
  imap <leader>m <ESC>:call SendToMuck()<CR>

  call s:SetupAccounts(g:mm_accounts)
endfunction

au BufRead,BufNewFile mucking_around call s:SetupMM()
