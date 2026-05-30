module Miso.Lynx.JSON

export
quote : String -> String
quote s = "\"" ++ s ++ "\""

export
showInt : Int -> String
showInt = show
