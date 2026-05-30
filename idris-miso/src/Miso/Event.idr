module Miso.Event

import Miso.Types

public export
Phase : Type
Phase = String

public export
BUBBLE : Phase
BUBBLE = "bubble"

public export
CAPTURE : Phase
CAPTURE = "capture"

public export
Events : Type
Events = List String

export
on : String -> action -> Attr action
on = On

export
onTap : action -> Attr action
onTap = On "tap"

export
emptyDecoder : ()
emptyDecoder = ()

export
defaultEvents : Events
defaultEvents = []
