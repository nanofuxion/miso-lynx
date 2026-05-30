module Miso.CSS

import Miso.Types

export
styles : List (Attr action) -> List (Attr action)
styles = id

export
height : String -> Attr action
height = Style "height"

export
width : String -> Attr action
width = Style "width"

export
display : String -> Attr action
display = Style "display"

export
alignItems : String -> Attr action
alignItems = Style "align-items"

export
justifyContent : String -> Attr action
justifyContent = Style "justify-content"

export
backgroundColor : String -> Attr action
backgroundColor = Style "background-color"

export
fontSize : String -> Attr action
fontSize = Style "font-size"

export
margin : String -> Attr action
margin = Style "margin"

export
yellow : String
yellow = "#ffff00"

export
orange : String
orange = "#ffa500"

export
pink : String
pink = "#ffc0cb"
