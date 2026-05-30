module Miso.Lynx.Element.Text.Property

import Miso.Attr
import Miso.Types
import Miso.Lynx.JSON

export
textMaxLine_ : Int -> Attr action
textMaxLine_ v = Prop "text-max-line" (show v)

export
includeFontPadding_ : Bool -> Attr action
includeFontPadding_ = boolProp "include-font-padding"

export
tailColorConvert_ : Bool -> Attr action
tailColorConvert_ = boolProp "tail-color-convert"

export
textSingleLineVerticalAlign_ : String -> Attr action
textSingleLineVerticalAlign_ = textProp "text-single-line-vertical-align"

export
textSelection_ : Bool -> Attr action
textSelection_ = boolProp "text-selection"

export
customContextMenu_ : Bool -> Attr action
customContextMenu_ = boolProp "custom-context-menu"

export
customTextSelection_ : Bool -> Attr action
customTextSelection_ = boolProp "custom-text-selection"

