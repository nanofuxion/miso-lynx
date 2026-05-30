module Miso.Lynx.Element.Image.Property

import Miso.Attr
import Miso.Types
import Miso.Lynx.JSON

export
mode_ : String -> Attr action
mode_ = textProp "mode"

export
placeholder_ : String -> Attr action
placeholder_ = textProp "placeholder"

export
blurRadius_ : String -> Attr action
blurRadius_ = textProp "blur-radius"

export
prefetchWidth_ : String -> Attr action
prefetchWidth_ = textProp "prefetch-width"

export
prefetchHeight_ : String -> Attr action
prefetchHeight_ = textProp "prefetch-height"

export
capInsets_ : String -> Attr action
capInsets_ = textProp "cap-insets"

export
capInsetsScale_ : Int -> Attr action
capInsetsScale_ v = Prop "cap-insets-scale" (show v)

export
loopCount_ : Int -> Attr action
loopCount_ v = Prop "loop-count" (show v)

export
imageConfig_ : String -> Attr action
imageConfig_ = textProp "image-config"

export
autoSize_ : Bool -> Attr action
autoSize_ = boolProp "auto-size"

export
deferSrcInvalidation_ : Bool -> Attr action
deferSrcInvalidation_ = boolProp "defer-src-invalidation"

export
autoPlay_ : Bool -> Attr action
autoPlay_ = boolProp "auto-play"

export
tintColor_ : Int -> Attr action
tintColor_ v = Prop "tint-color" (show v)

