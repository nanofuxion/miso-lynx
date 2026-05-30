module Miso.Lynx.Element.List.Method

import Miso.Effect
import Miso.Lynx.FFI

export
scrollToIndex : String -> IO () -> (String -> IO ()) -> Effect model action
scrollToIndex selector success fail = invokeExec selector "scrollToIndex" success fail

export
getVisibleCells : String -> IO () -> (String -> IO ()) -> Effect model action
getVisibleCells selector success fail = invokeExec selector "getVisibleCells" success fail

export
removeStickyView : String -> IO () -> (String -> IO ()) -> Effect model action
removeStickyView selector success fail = invokeExec selector "removeStickyView" success fail

export
autoScroll : String -> IO () -> (String -> IO ()) -> Effect model action
autoScroll selector success fail = invokeExec selector "autoScroll" success fail

export
scrollBy : String -> IO () -> (String -> IO ()) -> Effect model action
scrollBy selector success fail = invokeExec selector "scrollBy" success fail

export
getScrollInfo : String -> IO () -> (String -> IO ()) -> Effect model action
getScrollInfo selector success fail = invokeExec selector "getScrollInfo" success fail

export
scrollToPosition : String -> IO () -> (String -> IO ()) -> Effect model action
scrollToPosition selector success fail = invokeExec selector "scrollToPosition" success fail

export
getVisibleItemInfo : String -> IO () -> (String -> IO ()) -> Effect model action
getVisibleItemInfo selector success fail = invokeExec selector "getVisibleItemInfo" success fail
