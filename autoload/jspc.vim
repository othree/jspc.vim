" Vim plugin file
" Language:    JavaScript Parameter Complete function
" Maintainer:  othree <othree@gmail.com>
" Last Change: 2014/11/10
" Version:     0.1
" URL:         https://github.com/othree/jspc.vim

function! jspc#init()
  let b:jspc_omnifunc = &omnifunc
  let b:jspc_finding = 0
  setlocal omnifunc=jspc#omni
endfunction

function! jspc#filetype(filetype)
  return substitute(a:filetype, "[^a-z].*", "", "")
endfunction

function! jspc#omni(findstart, base)
  if a:findstart == 1
    let v = -1
    let v = jspc#complete(a:findstart, a:base)
    if v >= 0
      let b:jspc_finding = 1
    elseif b:jspc_omnifunc != '' 
      execute "let v = " . b:jspc_omnifunc . "(a:findstart, a:base)"
    endif
    return v
  else
    let v = []
    if b:jspc_finding == 1
      let b:jspc_finding = 0
      let v = jspc#complete(a:findstart, a:base)
    elseif b:jspc_omnifunc != '' 
      execute "let v = " . b:jspc_omnifunc . "(a:findstart, a:base)"
    endif
    return v
  endif
endfunc

function! jspc#meet(context)
  return a:context =~ "[\"']\k*$"
endfunction

function! jspc#complete(findstart, base)
  if a:findstart == 1
    let line = getline('.')
    let start = col('.') - 1
    while start >= 0 && (line[start - 1] !~ "[\"']" || line[start - 2] == "\\")
      let start -= 1
    endwhile
    return start
  else
    let pattern = '\k\zs \+\|(\|:'
    let line = getline('.')
    let col = col('.')
    let end = -1
    let index = match(line, pattern, end)
    let type = 'p' "parameter

    while index >= 0 && index < col
      let end = index
      let index = match(line, pattern, index + 1)
    endwhile

    if end == -1
      return []
    endif

    if line[end-1] =~ "[\"']"
      let end = end - 1
      let type = 'o' "options object
    endif

    let candidates = line[0 : end-1]
    let start = match(candidates, '\(\k\+\.\)\?[a-zA-Z0-9_\-$]\+$')
    let end = strlen(candidates)
    let method = candidates[start : end]

    execute "let res = jspc#". jspc#filetype(&filetype) ."#getlist(method)"
    let expr = 'v:val =~? '."'^".escape(a:base, '\\/.*$^~[]').".*'"
    let res = filter(deepcopy(res), expr)

    return res
  endif
endfunction
