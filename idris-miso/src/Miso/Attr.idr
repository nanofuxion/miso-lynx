module Miso.Attr

import Miso.Types

export
prop : String -> String -> Attr action
prop = Prop

export
textProp : String -> String -> Attr action
textProp = Prop

export
boolProp : String -> Bool -> Attr action
boolProp k v = Prop k (if v then "true" else "false")

export
styleProp : String -> String -> Attr action
styleProp = Style

export
key_ : String -> Attr action
key_ = Prop "key"

export
className_ : String -> Attr action
className_ = Prop "className"

export
id_ : String -> Attr action
id_ = Prop "id"
