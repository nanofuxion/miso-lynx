module Miso.Lynx.Element.ScrollView.Property

import Miso.Attr
import Miso.Types
import Miso.Lynx.JSON

export
scrollOrientation_ : String -> Attr action
scrollOrientation_ = textProp "scroll-orientation"

export
enableScroll_ : Bool -> Attr action
enableScroll_ = boolProp "enable-scroll"

export
initialScrollOffset_ : String -> Attr action
initialScrollOffset_ = textProp "initial-scroll-offset"

export
initialScrollToIndex_ : String -> Attr action
initialScrollToIndex_ = textProp "initial-scroll-to-index"

export
bounces_ : Bool -> Attr action
bounces_ = boolProp "bounces"

export
upperThreshold_ : String -> Attr action
upperThreshold_ = textProp "upper-threshold"

export
lowerThreshold_ : String -> Attr action
lowerThreshold_ = textProp "lower-threshold"

export
scrollBarEnable_ : Bool -> Attr action
scrollBarEnable_ = boolProp "scroll-bar-enable"

