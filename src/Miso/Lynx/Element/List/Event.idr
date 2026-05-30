module Miso.Lynx.Element.List.Event

import Miso.Event
import Miso.Types

export
listEvents : Events
listEvents =
  [ "scroll", "scrolltoupper", "scrolltolower", "scrollstatechange"
  , "nodeappear", "nodedisappear", "layoutcomplete"
  ]

export
onListScroll : action -> Attr action
onListScroll = On "scroll"

export
onListScrollToUpper : action -> Attr action
onListScrollToUpper = On "scrolltoupper"

export
onListScrollToLower : action -> Attr action
onListScrollToLower = On "scrolltolower"

export
onListScrollStateChange : action -> Attr action
onListScrollStateChange = On "scrollstatechange"

export
onNodeAppear : action -> Attr action
onNodeAppear = On "nodeappear"

export
onNodeDisappear : action -> Attr action
onNodeDisappear = On "nodedisappear"

export
onLayoutComplete : action -> Attr action
onLayoutComplete = On "layoutcomplete"
