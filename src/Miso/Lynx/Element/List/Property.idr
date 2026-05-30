module Miso.Lynx.Element.List.Property

import Miso.Attr
import Miso.Types
import Miso.Lynx.JSON

public export
data ListType = Single | Flow | Waterfall

public export
data ScrollOrientation = Vertical | Horizontal

public export
record ListOptions where
  constructor MkListOptions
  listType_ : ListType
  spanCount_ : Int
  scrollOrientation_ : ScrollOrientation

export
defaultListOptions : ListOptions
defaultListOptions = MkListOptions Single 1 Vertical

export
listTypeToString : ListType -> String
listTypeToString Single = "single"
listTypeToString Flow = "flow"
listTypeToString Waterfall = "waterfall"

export
scrollOrientationToString : ScrollOrientation -> String
scrollOrientationToString Vertical = "vertical"
scrollOrientationToString Horizontal = "horizontal"

export
itemKey_ : String -> Attr action
itemKey_ = textProp "item-key"

export
enableScroll_ : Bool -> Attr action
enableScroll_ = boolProp "enable-scroll"

export
enableNestedScroll_ : Bool -> Attr action
enableNestedScroll_ = boolProp "enable-nested-scroll"

export
listMainAxisGap_ : String -> Attr action
listMainAxisGap_ = textProp "list-main-axis-gap"

export
listCrossAxisGap_ : String -> Attr action
listCrossAxisGap_ = textProp "list-cross-axis-gap"

export
sticky_ : Bool -> Attr action
sticky_ = boolProp "sticky"

export
stickyOffset_ : Int -> Attr action
stickyOffset_ v = Prop "sticky-offset" (show v)

export
stickyTop_ : Bool -> Attr action
stickyTop_ = boolProp "sticky-top"

export
stickyBottom_ : Bool -> Attr action
stickyBottom_ = boolProp "sticky-bottom"

export
bounces_ : Bool -> Attr action
bounces_ = boolProp "bounces"

export
initialScrollIndex_ : Int -> Attr action
initialScrollIndex_ v = Prop "initial-scroll-index" (show v)

export
needVisibleItemInfo_ : Bool -> Attr action
needVisibleItemInfo_ = boolProp "sticky-bottom"

export
upperThresholdItemCount_ : Int -> Attr action
upperThresholdItemCount_ v = Prop "upper-threshold-item-count" (show v)

export
lowerThresholdItemCount_ : Int -> Attr action
lowerThresholdItemCount_ v = Prop "lower-threshold-item-count" (show v)

export
scrollEventThrottle_ : Int -> Attr action
scrollEventThrottle_ v = Prop "scroll-event-throttle" (show v)

export
itemSnap_ : String -> Attr action
itemSnap_ = textProp "item-snap"

export
needLayoutCompleteInfo_ : Bool -> Attr action
needLayoutCompleteInfo_ = boolProp "need-layout-complete-info"

export
layoutId_ : Int -> Attr action
layoutId_ v = Prop "layout-id" (show v)

export
preloadBufferCount_ : Int -> Attr action
preloadBufferCount_ v = Prop "preload-buffer-count" (show v)

export
scrollBarEnable_ : Bool -> Attr action
scrollBarEnable_ = boolProp "scroll-bar-enable"

export
reuseIdentifier_ : String -> Attr action
reuseIdentifier_ = textProp "reuse-identifier"

export
fullSpan_ : Bool -> Attr action
fullSpan_ = boolProp "full-span"

export
estimatedMainAxisSizePx_ : Int -> Attr action
estimatedMainAxisSizePx_ v = Prop "estimated-main-axis-size-px" (show v)

