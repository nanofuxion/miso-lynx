module Miso.Lynx.Element.ScrollView.Method

import Miso.Effect
import Miso.Lynx.FFI

export
scrollTo : String -> IO () -> (String -> IO ()) -> Effect model action
scrollTo selector success fail = invokeExec selector "scrollTo" success fail

export
scrollIntoView : String -> IO () -> (String -> IO ()) -> Effect model action
scrollIntoView selector success fail = invokeExec selector "scrollIntoView" success fail

export
autoScroll : String -> IO () -> (String -> IO ()) -> Effect model action
autoScroll selector success fail = invokeExec selector "autoScroll" success fail

export
scrollBy : String -> IO () -> (String -> IO ()) -> Effect model action
scrollBy selector success fail = invokeExec selector "scrollBy" success fail

export
getScrollInfo : String -> IO () -> (String -> IO ()) -> Effect model action
getScrollInfo selector success fail = invokeExec selector "getScrollInfo" success fail
