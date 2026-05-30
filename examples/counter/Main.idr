module Main

import Miso.Types
import Miso.App
import Miso.CSS
import Miso.Lynx
import Miso.Lynx.Element.View.Event

record Model where
  constructor MkModel
  value : Int

data Action = AddOne | SubtractOne

updateModel : Action -> Model -> Model
updateModel AddOne (MkModel v) = MkModel (v + 1)
updateModel SubtractOne (MkModel v) = MkModel (v - 1)

flexCenter : List (Attr Action)
flexCenter =
  [ Style "display" "flex"
  , Style "align-items" "center"
  , Style "justify-content" "center"
  ]

viewModel : Model -> View Action
viewModel (MkModel v) =
  view_
    (Style "height" "200px" :: Style "display" "flex" :: Style "align-items" "center" :: Style "justify-content" "center" :: [])
    [ view_
        (onTap AddOne :: Style "background-color" yellow :: Style "width" "100px" :: Style "height" "100px" :: Style "margin" "2px" :: flexCenter)
        [ text_ [Style "font-size" "48px"] [VText "🐈"] ]
    , view_
        (Style "background-color" orange :: Style "width" "100px" :: Style "height" "100px" :: flexCenter)
        [ text_ [Style "font-size" "48px"] [VText (show v)] ]
    , view_
        (onTap SubtractOne :: Style "background-color" pink :: Style "width" "100px" :: Style "height" "100px" :: Style "margin" "2px" :: flexCenter)
        [ text_ [Style "font-size" "48px"] [VText "🍜"] ]
    ]

counterComponent : App Model Action
counterComponent = component (MkModel 0) updateModel viewModel

main : IO ()
main = lynx lynxEvents counterComponent
