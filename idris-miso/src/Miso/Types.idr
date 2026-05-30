module Miso.Types

import public Data.String

public export
data Attr action
  = Prop String String
  | Style String String
  | On String action

public export
data View action
  = VNode String (List (Attr action)) (List (View action))
  | VText String

public export
Namespace : Type
Namespace = String

public export
HTML : Namespace
HTML = "html"

public export
node : Namespace -> String -> List (Attr action) -> List (View action) -> View action
node _ tag attrs children = VNode tag attrs children

public export
text : String -> View action
text = VText
