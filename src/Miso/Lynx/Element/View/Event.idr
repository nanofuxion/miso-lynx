module Miso.Lynx.Element.View.Event

import Miso.Event
import Miso.Types

export
viewEvents : Events
viewEvents =
  [ "touchstart", "touchmove", "touchend", "touchcancel", "tap", "longpress"
  , "layoutchange", "uiappear", "uidisappear", "animationstart", "animationend"
  , "animationcancel", "animationiteration", "transitionstart", "transitionend"
  , "transitioncancel"
  ]

export
onTouchStart : action -> Attr action
onTouchStart = On "touchstart"

export
onTouchMove : action -> Attr action
onTouchMove = On "touchmove"

export
onTouchEnd : action -> Attr action
onTouchEnd = On "touchend"

export
onTouchCancel : action -> Attr action
onTouchCancel = On "touchcancel"

export
onTap : action -> Attr action
onTap = On "tap"

export
onLongPress : action -> Attr action
onLongPress = On "longpress"

export
onLayoutChange : action -> Attr action
onLayoutChange = On "layoutchange"

export
onAppear : action -> Attr action
onAppear = On "uiappear"

export
onDisappear : action -> Attr action
onDisappear = On "uidisappear"

export
onAnimationStart : action -> Attr action
onAnimationStart = On "animationstart"

export
onAnimationEnd : action -> Attr action
onAnimationEnd = On "animationend"

export
onAnimationCancel : action -> Attr action
onAnimationCancel = On "animationcancel"

export
onAnimationIteration : action -> Attr action
onAnimationIteration = On "animationiteration"

export
onTransitionStart : action -> Attr action
onTransitionStart = On "transitionstart"

export
onTransitionEnd : action -> Attr action
onTransitionEnd = On "transitionend"

export
onTransitionCancel : action -> Attr action
onTransitionCancel = On "transitioncancel"
