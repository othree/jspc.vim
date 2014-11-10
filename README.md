JavaScript Parameter Complete a.k.a JSPC
=========================================

Complete encrypt alogrithm name and event name for JavaScript


Configure
---------

Configure for [autocomplpop][]:

    let behavs = { 'javascript': []}
    call add(behavs.javascript, {
    \ 'command' : "\<C-x>\<C-u>",
    \ 'completefunc' : 'jspc#complete',
    \ 'meets' : 'jspc#meet',
    \ 'repeat' : 0,
    \ })
    let g:acp_behavior = {}
    call extend(g:acp_behavior, behavs, 'keep')


[autocomplpop]:https://github.com/othree/vim-autocomplpop
