function! jspc#typescript#getlist(method)
  let list = []

  if a:method == "getResponseHeader"
    let list = [
     \ "Access-Control-Allow-Origin",
     \ "Accept-Ranges",
     \ "Age",
     \ "Allow",
     \ "Cache-Control",
     \ "Connection",
     \ "Content-Encoding",
     \ "Content-Language",
     \ "Content-Length",
     \ "Content-Location",
     \ "Content-MD5",
     \ "Content-Disposition",
     \ "Content-Range",
     \ "Content-Type",
     \ "Date",
     \ "ETag",
     \ "Expires",
     \ "Last-Modified",
     \ "Link",
     \ "Location",
     \ "P3P",
     \ "Pragma",
     \ "Proxy-Authenticate",
     \ "Refresh",
     \ "Retry-After",
     \ "Server",
     \ "Set-Cookie",
     \ "Status",
     \ "Strict-Transport-Security",
     \ "Trailer",
     \ "Transfer-Encoding",
     \ "Upgrade",
     \ "Vary",
     \ "Via",
     \ "Warning",
     \ "WWW-Authenticate",
     \ "X-Frame-Options",
     \ "Public-Key-Pins",
     \ "X-XSS-Protection",
     \ "Content-Security-Policy",
     \ "X-Content-Security-Policy",
     \ "X-WebKit-CSP",
     \ "X-Content-Type-Options",
     \ "X-Powered-By",
     \ "X-UA-Compatible"
     \ ]
  endif

  if a:method == "setRequestHeader"
    let list = [
     \ "Accept",
     \ "Accept-Charset",
     \ "Accept-Encoding",
     \ "Accept-Language",
     \ "Accept-Datetime",
     \ "Authorization",
     \ "Cache-Control",
     \ "Connection",
     \ "Cookie",
     \ "Content-Length",
     \ "Content-MD5",
     \ "Content-Type",
     \ "Date",
     \ "Expect",
     \ "From",
     \ "Host",
     \ "If-Match",
     \ "If-Modified-Since",
     \ "If-None-Match",
     \ "If-Range",
     \ "If-Unmodified-Since",
     \ "Max-Forwards",
     \ "Origin",
     \ "Pragma",
     \ "Proxy-Authorization",
     \ "Range",
     \ "Referer",
     \ "TE",
     \ "User-Agent",
     \ "Upgrade",
     \ "Via",
     \ "Warning",
     \ "X-Requested-With",
     \ "DNT",
     \ "X-Forwarded-For",
     \ "X-Forwarded-Host",
     \ "X-Forwarded-Proto",
     \ "Front-End-Https",
     \ "X-Http-Method-Override",
     \ "X-ATT-DeviceId",
     \ "X-Wap-Profile",
     \ "Proxy-Connection"
     \ ]
  endif

  if a:method == "contentType" || a:method == "Content-Type" || a:method == "Accept"
    let list = [
     \ "application/javascript",
     \ "application/json",
     \ "application/x-www-form-urlencoded",
     \ "aaplication/xml",
     \ "multipart/form-data",
     \ "text/html",
     \ "text/xml"
     \ ]
  endif

  if a:method == "dataType"
    let list = [
     \ "xml",
     \ "html",
     \ "json",
     \ "jsonp",
     \ "text"
     \ ]
  endif

  if a:method == "toLocaleString" || a:method == "toLocaleDateString" || a:method == "toLocaleTimeString"
    let list = [
     \ "ar-EG",
     \ "cs-CZ",
     \ "da-DK",
     \ "de-AT",
     \ "de-CH",
     \ "de-DE",
     \ "el-GR",
     \ "en-GB",
     \ "en-US",
     \ "es-ES",
     \ "es-MX",
     \ "fi-FI",
     \ "fr-CA",
     \ "fr-CH",
     \ "fr-FR",
     \ "hu-HU",
     \ "it-IT",
     \ "ja-JP",
     \ "ko-KR",
     \ "my-MM",
     \ "nb-NO",
     \ "nl-NL",
     \ "pl-PL",
     \ "pt-BR",
     \ "pt-PT",
     \ "ro-RO",
     \ "ru-RU",
     \ "sv-SE",
     \ "th-TH",
     \ "tr-TR",
     \ "vi-VN",
     \ "zh-CN",
     \ "zh-TW",
     \ "id-ID"
     \ ]
  endif

  if a:method == "createElement" || a:method == "createElementNS"
    let list = [
     \ "a",
     \ "abbr",
     \ "address",
     \ "area",
     \ "article",
     \ "aside",
     \ "audio",
     \ "b",
     \ "base",
     \ "bdi",
     \ "bdo",
     \ "blockquote",
     \ "body",
     \ "br",
     \ "button",
     \ "canvas",
     \ "caption",
     \ "center",
     \ "cite",
     \ "code",
     \ "col",
     \ "colgroup",
     \ "content",
     \ "data",
     \ "datalist",
     \ "dd",
     \ "decorator",
     \ "del",
     \ "details",
     \ "dfn",
     \ "dialog",
     \ "div",
     \ "dl",
     \ "dt",
     \ "element",
     \ "em",
     \ "embed",
     \ "fieldset",
     \ "figcaption",
     \ "figure",
     \ "font",
     \ "footer",
     \ "form",
     \ "h1",
     \ "h2",
     \ "h3",
     \ "h4",
     \ "h5",
     \ "h6",
     \ "head",
     \ "header",
     \ "hr",
     \ "html",
     \ "i",
     \ "iframe",
     \ "img",
     \ "input",
     \ "ins",
     \ "kbd",
     \ "keygen",
     \ "label",
     \ "legend",
     \ "li",
     \ "link",
     \ "main",
     \ "map",
     \ "mark",
     \ "menu",
     \ "menuitem",
     \ "meta",
     \ "meter",
     \ "nav",
     \ "noscript",
     \ "object",
     \ "ol",
     \ "optgroup",
     \ "option",
     \ "output",
     \ "p",
     \ "param",
     \ "picture",
     \ "pre",
     \ "progress",
     \ "q",
     \ "rp",
     \ "rt",
     \ "ruby",
     \ "s",
     \ "samp",
     \ "script",
     \ "section",
     \ "select",
     \ "shadow",
     \ "small",
     \ "source",
     \ "span",
     \ "strong",
     \ "style",
     \ "sub",
     \ "summary",
     \ "sup",
     \ "table",
     \ "tbody",
     \ "td",
     \ "template",
     \ "textarea",
     \ "tfoot",
     \ "th",
     \ "thead",
     \ "time",
     \ "title",
     \ "tr",
     \ "track",
     \ "u",
     \ "ul",
     \ "var",
     \ "video",
     \ "wbr"
     \ ]
  endif

  if a:method == "open" || a:method == "method"
    let list = [
     \ "GET",
     \ "POST",
     \ "PUT",
     \ "DELETE",
     \ "PATCH",
     \ "HEAD",
     \ "OPTIONS"
     \ ]
  endif

  if a:method == "toDataURL" || a:method == "toBlob"
    let list = [
     \ "image/jpg",
     \ "image/jpeg",
     \ "image/png"
     \ ]
  endif

  if a:method == "encrypt" || a:method == "decrypt"
    let list = [
     \ "RSAES-PKCS1-v1_5",
     \ "RSASSA-PKCS1-v1_5",
     \ "RSA-PSS",
     \ "RSA-OAEP",
     \ "ECDSA",
     \ "ECDH",
     \ "AES-CTR",
     \ "AES-CBC",
     \ "AES-CMAC",
     \ "AES-GCM",
     \ "AES-CFB",
     \ "AES-KW",
     \ "HMAC",
     \ "DH",
     \ "SHA-1",
     \ "SHA-256",
     \ "SHA-384",
     \ "SHA-512",
     \ "CONCAT",
     \ "HKDF-CTR",
     \ "PBKDF2"
     \ ]
  endif

  if a:method == "addEventListener" || a:method == "removeEventListener" || a:method == "on" || a:method == "one" || a:method == "once" || a:method == "off" || a:method == "bind" || a:method == "trigger" || a:method == "delegate" || a:method == "undelegate" || a:method == "listenTo" || a:method == "stopListening" || a:method == "listenToOnce"
    let list = [
     \ "animationend",
     \ "animationiteration",
     \ "animationstart",
     \ "beginEvent",
     \ "endEvent",
     \ "repeatEvent",
     \ "CssRuleViewRefreshed",
     \ "CssRuleViewChanged",
     \ "CssRuleViewCSSLinkClicked",
     \ "transitionend",
     \ "blocked",
     \ "complete",
     \ "error",
     \ "success",
     \ "upgradeneeded",
     \ "versionchange",
     \ "DOMLinkAdded",
     \ "DOMLinkRemoved",
     \ "DOMMetaAdded",
     \ "DOMMetaRemoved",
     \ "DOMWillOpenModalDialog",
     \ "DOMModalDialogClosed",
     \ "unload",
     \ "DOMAttributeNameChanged",
     \ "DOMAttrModified",
     \ "DOMCharacterDataModified",
     \ "DOMContentLoaded",
     \ "DOMElementNameChanged",
     \ "DOMNodeInserted",
     \ "DOMNodeInsertedIntoDocument",
     \ "DOMNodeRemoved",
     \ "DOMNodeRemovedFromDocument",
     \ "DOMSubtreeModified",
     \ "drag",
     \ "dragdrop",
     \ "dragend",
     \ "dragenter",
     \ "dragexit",
     \ "draggesture",
     \ "dragleave",
     \ "dragover",
     \ "dragstart",
     \ "drop",
     \ "invalid",
     \ "overflow",
     \ "underflow",
     \ "DOMAutoComplete",
     \ "command",
     \ "commandupdate",
     \ "blur",
     \ "change",
     \ "DOMFocusIn",
     \ "DOMFocusOut",
     \ "focus",
     \ "focusin",
     \ "focusout",
     \ "reset",
     \ "submit",
     \ "DOMFrameContentLoaded",
     \ "click",
     \ "contextmenu",
     \ "DOMMouseScroll",
     \ "dblclick",
     \ "gamepadconnected",
     \ "gamepaddisconnected",
     \ "keydown",
     \ "keypress",
     \ "keyup",
     \ "mousedown",
     \ "mouseenter",
     \ "mouseleave",
     \ "mousemove",
     \ "mouseout",
     \ "mouseover",
     \ "mouseup",
     \ "mousewheel",
     \ "pointerlockchange",
     \ "pointerlockerror",
     \ "wheel",
     \ "audioprocess",
     \ "canplay",
     \ "canplaythrough",
     \ "durationchange",
     \ "emptied",
     \ "ended",
     \ "ended",
     \ "loadeddata",
     \ "loadedmetadata",
     \ "pause",
     \ "play",
     \ "playing",
     \ "ratechange",
     \ "seeked",
     \ "seeking",
     \ "stalled",
     \ "suspend",
     \ "timeupdate",
     \ "volumechange",
     \ "waiting",
     \ "complete",
     \ "DOMMenuItemActive",
     \ "DOMMenuItemInactive",
     \ "datachange",
     \ "dataerror",
     \ "disabled",
     \ "enabled",
     \ "offline",
     \ "online",
     \ "statuschange",
     \ "connectionInfoUpdate",
     \ "abort",
     \ "error",
     \ "load",
     \ "loadend",
     \ "loadstart",
     \ "progress",
     \ "timeout",
     \ "uploadprogress",
     \ "cached",
     \ "error",
     \ "load",
     \ "afterscriptexecute",
     \ "beforescriptexecute",
     \ "compassneedscalibration",
     \ "devicelight",
     \ "devicemotion",
     \ "deviceorientation",
     \ "deviceproximity",
     \ "orientationchange",
     \ "userproximity",
     \ "pagehide",
     \ "pageshow",
     \ "popstate",
     \ "storage",
     \ "SVGAbort",
     \ "SVGError",
     \ "SVGLoad",
     \ "SVGResize",
     \ "SVGScroll",
     \ "SVGUnload",
     \ "SVGZoom",
     \ "visibilitychange",
     \ "compositionend",
     \ "compositionstart",
     \ "compositionupdate",
     \ "copy",
     \ "cut",
     \ "paste",
     \ "select",
     \ "text",
     \ "touchcancel",
     \ "touchend",
     \ "touchenter",
     \ "touchleave",
     \ "touchmove",
     \ "touchstart",
     \ "checking",
     \ "downloading",
     \ "error",
     \ "noupdate",
     \ "obsolete",
     \ "updateready",
     \ "hashchange",
     \ "input",
     \ "readystatechange",
     \ "fullscreen",
     \ "fullscreenchange",
     \ "fullscreenerror",
     \ "resize",
     \ "scroll",
     \ "close",
     \ "error",
     \ "message",
     \ "open",
     \ "DOMWindowCreated",
     \ "DOMWindowClose",
     \ "DOMTitleChanged",
     \ "beforeunload",
     \ "message",
     \ "show"
     \ ]
  endif

  return list
endfunction
