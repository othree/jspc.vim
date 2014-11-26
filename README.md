JavaScript Parameter Complete
=========================================

JavaScript Parameter Complete(JSPC) is a complete function for function parameters. Such as event names, crypto algorithms, common locales.

Some function use string as parameter. But have pre defined value. This complete function is specify for this kind of string value.
Current JSPC only support JavaScript and several compile to JavaScript languages. Support function are from common lib and web standards.
But JSPC is very easy to extend for other language.

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

The cursor is just after `'`. And JSPC know its inside a function call. The function is `addEventLitenser`. 
Then JSPC can find the possible values for `addEventLitenser`. Evevy material need be in the same line to make it happen.
JSPC will not look up on previous line. So.

    node.addEventLitenser(
      'click',
      handler,
      false
    );

This kind of coding style will not work for JSPC. JSPC also supports function call without `(`. Like CoffeeScript and Ruby:

    node.addEventLitenser 'click'

### Options Object

JSPC have an experimental support for options object:

    fetch('url', {
      method: "P_"
    });

In this example, you will got `POST`, `PUT`, `PATCH` as complete candidates. String key also supports:

    {
      "method": "P"
    }

Current implementation will lookup candidate on every object. Not only options object as function parameter. And it only check attribute key. Not the function/method name.

Support Functions
-----------------

JavaScript and similar language:

- DOM/BOM event for DOM API, jQuery and Backbone
- HTML element name for DOM API
- HTTP method for XHR
- Image type for toBlob and to DataURL from canvas
- Web Crypto algorithm
- General locale for Intl(toLocaleString)
- Media Type(Content-Type) for fetch
- fetch response.headers.get

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
