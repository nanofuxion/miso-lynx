module Miso.Lynx.Element

import Miso.Types
import Miso.Attr
import Miso.Lynx.Element.List.Property

export
lynx_ : String -> List (Attr action) -> List (View action) -> View action
lynx_ = node HTML

export
page_ : List (Attr action) -> List (View action) -> View action
page_ = lynx_ "page"

export
view_ : List (Attr action) -> List (View action) -> View action
view_ = lynx_ "view"

export
scrollView_ : List (Attr action) -> List (View action) -> View action
scrollView_ = lynx_ "scroll-view"

export
image_ : String -> List (Attr action) -> View action
image_ url attrs = lynx_ "image" (Prop "src" url :: attrs) []

export
listItem_ : List (Attr action) -> List (View action) -> View action
listItem_ = lynx_ "list-item"

export
list_ : ListOptions -> List (Attr action) -> List (View action) -> View action
list_ opts attrs children =
  let defaults =
        [ Prop "list-type" (listTypeToString opts.listType_)
        , Prop "span-count" (show opts.spanCount_)
        , Prop "scroll-orientation" (scrollOrientationToString opts.scrollOrientation_)
        ]
  in lynx_ "list" (defaults ++ attrs) children

export
text_ : List (Attr action) -> List (View action) -> View action
text_ = lynx_ "text"

export
frame_ : List (Attr action) -> View action
frame_ attrs = lynx_ "frame" attrs []
