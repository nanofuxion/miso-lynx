module Miso.Lynx.Element.ScrollView.Event

import Miso.Event
import Miso.Types

export
scrollViewEvents : Events
scrollViewEvents =
  [ "scroll", "scrolltoupper", "scrolltolower", "scrollend"
  , "contentsizechanged", "scrollstatechange"
  ]

export
onScroll : action -> Attr action
onScroll = On "scroll"

export
onScrollToUpper : action -> Attr action
onScrollToUpper = On "scrolltoupper"

export
onScrollToLower : action -> Attr action
onScrollToLower = On "scrolltolower"

export
onScrollEnd : action -> Attr action
onScrollEnd = On "scrollend"

export
onContentSizeChanged : action -> Attr action
onContentSizeChanged = On "contentsizechanged"

export
onScrollStateChange : action -> Attr action
onScrollStateChange = On "scrollstatechange"
