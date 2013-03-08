
function! s:CoffeeConvert()
  let start = line('.')
  let end = line('$')
  let lines = getline(start, end)
  let script = join(lines, "\n")
  let result = system('coffee -scb 2>/dev/null', script)

  if strlen(result)
    normal! ggdG
    call append(0, split(result, '\v\n'))
  else
    echom 'error'
  endif

endfunction

nnoremap ;u :call <SID>CoffeeConvert()<cr>
