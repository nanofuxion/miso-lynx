module Miso.Lynx.Element.Image.Method

import Miso.Effect
import Miso.Lynx.FFI

export
startAnimation : String -> IO () -> (String -> IO ()) -> Effect model action
startAnimation selector success fail = invokeExec selector "startAnimate" success fail

export
pauseAnimation : String -> IO () -> (String -> IO ()) -> Effect model action
pauseAnimation selector success fail = invokeExec selector "pauseAnimation" success fail

export
stopAnimation : String -> IO () -> (String -> IO ()) -> Effect model action
stopAnimation selector success fail = invokeExec selector "stopAnimation" success fail

export
resumeAnimation : String -> IO () -> (String -> IO ()) -> Effect model action
resumeAnimation selector success fail = invokeExec selector "resumeAnimation" success fail
