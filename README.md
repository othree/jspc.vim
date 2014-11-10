JavaScript Parameter Complete
=========================================

JavaScript Parameter Complete(JSPC) is complete function for crypto alogrithm name and event name used by JavaScript Web API.

Why
---

Why here is a JavaScript complete function just for parameter values? Because almost all complete functino can't do this:

* ternjs not able to deal with this.
* Other JS complete function neither can't.
* SyntaxComplete will not allow non keyword characters. And several algorithm name have `-`.
* Dictionary might be ok. But need some configuration and require specify path to the dictionary file.

Since autocomplpop supports multiple complete function. So I start this project. First target is to support event name and crypto algorithm name.


Future
------

Build a framework to let this feature can be used on other language.

Configure
---------

Configure for [autocomplpop][]:

    let behavs = { 'javascript': [] }
    call add(behavs.javascript, {
    \ 'command' : "\<C-x>\<C-u>",
    \ 'completefunc' : 'jspc#complete',
    \ 'meets' : 'jspc#meet',
    \ 'repeat' : 0,
    \ })
    let g:acp_behavior = {}
    call extend(g:acp_behavior, behavs, 'keep')


[autocomplpop]:https://github.com/othree/vim-autocomplpop
