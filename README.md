JavaScript Parameter Complete
=========================================

JavaScript Parameter Complete(JSPC) is a completion function for function parameters, such as event names, crypto algorithms, and common locales.

Some functions use strings as parameter, but have pre-defined values. This plugin is for specifying the kind of string value.
Currently, JSPC only supports JavaScript and several compile-to-JavaScript languages. Supported functions are from common libraries and web standards.
But JSPC is very easy to extend for any other language.

Why
---

Why is there a JavaScript completion function just for parameter values? Because almost all completion functions can't do this:

* ternjs is not able to deal with this.
* Other JS complete function cannot either
* SyntaxComplete will not allow non keyword characters. And several algorithm name have `-`.
* Dictionary might be ok. But it needs some configuration and requires specifying a path to the dictionary file.

Since autocomplpop supports multiple complete function, I started this project. First target is to support event names and crypto algorithm names.


Supported Languages
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

No special configuration is required. JSPC will wrap omnifunc, and if the cursor position is inside string quotes and the string is in `encrypt` or `on` the function call's argument list, It will use JSPC to grab the completion suggestion. Otherwise it will use original omnifunc.

[autocomplpop]:https://github.com/othree/vim-autocomplpop

How
---

JSPC will only trigger while the cursor position is inside string literal. Which means inside or after `'` or `"`.
Then it will figure out if this string is an argument of function call, ex:

    node.addEventListener('_

The cursor is just after `'`, and JSPC knows it's inside a function call. The function is `addEventListener`. 
Then JSPC can find the possible values for `addEventListener`. Every material needs to be in the same line to make it happen.
JSPC will not look up on previous line. So.

    node.addEventListener(
      'click',
      handler,
      false
    );

This kind of coding style will not work for JSPC. JSPC also supports function calls without `(`. Like CoffeeScript and Ruby:

    node.addEventListener 'click'

### Options Object

JSPC has experimental support for options object:

    fetch('url', {
      method: "P_"
    });

In this example, you will got `POST`, `PUT`, `PATCH` as complete candidates. String key also supports:

    {
      "method": "P"
    }

Current implementation will lookup candidate on every object. Not only options object as function parameter. And it only checks attribute key. Not the function/method name.

Supported Functions
-----------------

JavaScript and similar language:

- DOM/BOM event for DOM API, jQuery and Backbone
- HTML element name for DOM API
- HTTP method for XHR
- Image type for toBlob and to DataURL from canvas
- Web Crypto algorithm
- General locale for Intl(toLocaleString)
- Media Type(Content-Type) for fetch and XHR
- fetch response.headers.get
- PaymentResponse.complete

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
