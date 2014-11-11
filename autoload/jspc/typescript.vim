function! jspc#typescript#getlist(method)
  let list = []

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
