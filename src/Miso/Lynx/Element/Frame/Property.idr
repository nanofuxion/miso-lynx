module Miso.Lynx.Element.Frame.Property

import Miso.Attr
import Miso.Types
import Miso.Lynx.JSON

export
src_ : String -> Attr action
src_ = textProp "src"

