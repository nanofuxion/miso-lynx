module Miso.Render

import Miso.App
import Miso.Event
import Miso.Types

%foreign "javascript:lambda:(events,renderer,init,update,view)=>globalThis.idrisMiso.renderApp(events,renderer,init,(m,a)=>update(a)(m),(m)=>view(m))"
prim__renderApp : Events -> String -> a -> (b -> a -> a) -> (a -> View b) -> IO ()

export
renderApp : Events -> String -> App a b -> IO ()
renderApp events renderer (MkComponent init upd vw) =
  prim__renderApp events renderer init upd vw

export
lynx : Events -> App a b -> IO ()
lynx events app = renderApp events "native" app
