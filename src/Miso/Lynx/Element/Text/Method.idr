module Miso.Lynx.Element.Text.Method

import Miso.Effect
import Miso.Lynx.FFI

export
getTextBoundingRect : String -> IO () -> (String -> IO ()) -> Effect model action
getTextBoundingRect selector success fail =
  invokeExec selector "boundingClientRect" success fail
