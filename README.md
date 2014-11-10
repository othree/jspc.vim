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

Installation
------------

Use [Vundle][] or [pathogen.vim][] is recommended.

[Vundle]:https://github.com/gmarik/vundle
[pathogen.vim]:https://github.com/tpope/vim-pathogen

For Vundle:

    Plugin 'othree/jspc.vim'

Configure
---------

No special configure required. JSPC will wrap omnifunc. And if cursor position is inside string quotes and the string is in `encrypt` or `on` function call's argument list. It will use JSPC to grab the complete suggestion. Otherwise it will use original omnifunc.

[autocomplpop]:https://github.com/othree/vim-autocomplpop
