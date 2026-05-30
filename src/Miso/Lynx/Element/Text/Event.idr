module Miso.Lynx.Element.Text.Event

import Miso.Event
import Miso.Types

export
textEvents : Events
textEvents = ["layout", "tap"]

export
onLayout : action -> Attr action
onLayout = On "layout"

export
onTextTap : action -> Attr action
onTextTap = On "tap"
