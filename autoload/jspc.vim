" Vim plugin file
" Language:    JavaScript Parameter Complete function
" Maintainer:  othree <othree@gmail.com>
" Last Change: 2014/11/10
" Version:     0.1
" URL:         https://github.com/othree/jspc.vim

function! jspc#init()
  let w:jspc_omnifunc = &omnifunc
  let w:jspc_finding = 0
  set omnifunc=jspc#omni
endfunction

function! jspc#omni(findstart, base)
  if a:findstart == 1
    let v = -1
    let v = jspc#complete(a:findstart, a:base)
    if v >= 0
      let w:jspc_finding = 1
    elseif w:jspc_omnifunc != '' 
      execute "let v = " . w:jspc_omnifunc . "(a:findstart, a:base)"
    endif
    return v
  else
    let v = []
    if w:jspc_finding == 1
      let w:jspc_finding = 0
      let v = jspc#complete(a:findstart, a:base)
    elseif w:jspc_omnifunc != '' 
      execute "let v = " . w:jspc_omnifunc . "(a:findstart, a:base)"
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
    while start >= 0 && line[start - 1] !~ "[\"']"
      let start -= 1
    endwhile
    return start
  else
    let pattern = ',\@<! \+\|('
    let line = getline('.')
    let col = col('.')
    let end = -1
    let index = match(line, pattern, end)

    while index >= 0 && index < col
      let end = index
      let index = match(line, pattern, index + 1)
    endwhile

    if end == -1
      return []
    endif

    let candidates = line[0 : end-1]
    let start = match(candidates, '\k\+$')
    let end = strlen(candidates)
    let method = candidates[start : end]

    let res = jspc#getlist(method)
    let expr = 'v:val =~? '."'^".escape(a:base, '\\/.*$^~[]').".*'"
    let res = filter(deepcopy(res), expr)

    return res
  endif
endfunction

function! jspc#getlist(method)
  let list = []

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

  if a:method == "addEventListener" || a:method == "removeEventListener" || a:method == "on" || a:method == "one" || a:method == "off"
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

