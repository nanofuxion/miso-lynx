module Miso.Lynx.Element.View.Method

import Miso.Effect
import Miso.Lynx.FFI

export
boundingClientRect : String -> IO () -> (String -> IO ()) -> Effect model action
boundingClientRect selector success fail =
  invokeExec selector "boundingClientRect" success fail

export
takeScreenshot : String -> IO () -> (String -> IO ()) -> Effect model action
takeScreenshot selector success fail =
  invokeExec selector "takeScreenshot" success fail

export
requestAccessibilityFocus : String -> IO () -> (String -> IO ()) -> Effect model action
requestAccessibilityFocus selector success fail =
  invokeExec selector "requestAccessibilityFocus" success fail
