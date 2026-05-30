module Miso.Lynx.Element.Image.Event

import Miso.Event
import Miso.Types

export
imageEvents : Events
imageEvents = ["load", "error"]

export
onLoad : action -> Attr action
onLoad = On "bindload"

export
onError : action -> Attr action
onError = On "binderror"
