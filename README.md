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


Support Languages
-----------------

- JavaScript
- CoffeeScript
- LiveScript
- TypeScript

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

How
---

JSPC will only trigger while cursor position is inside string literial. Which means inside or after `'` or `"`.
And then it will figure out is this string an argument of function call, ex:

    node.addEventLitenser('_

The cursor is just after `'`. And JSPC know iys inside a function call. The function is `addEventLitenser`. 
Then JSPC can find the possible values for `addEventLitenser`. Evevy material need be in the same line to make it happen.
JSPC will not look up on previous line. So.

    node.addEventLitenser(
      'click',
      handler,
      false
    );

This kind of coding style will not work for JSPC. JSPC also supports function call without `(`. Like CoffeeScript and Ruby:

    node.addEventLitenser 'click'


Extend
------

Structure of JSPC is very easy to extend. To extend JSPC supporting other language. Follow the following steps:

1. Add `after/ftplugin/${filetype}.vim`. Just copy from `after/ftplugin/javascript.vim`.
2. Write `data/${filetype}.yml`.
3. Edit `data/gen.sh`. Add filetype to the list.
4. `npm install` and execute `gen.sh`.

Patch to support other language is welcome.

License
-------

MIT
