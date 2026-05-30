module Miso.Lynx

import public Miso.Lynx.Element
import public Miso.Lynx.FFI
import public Miso.Lynx.Event
import Miso.Render as R
import Miso.App
import Miso.Event

export
startLynx : Events -> App model action -> IO ()
startLynx = lynx

export
lynx : Events -> App model action -> IO ()
lynx = R.lynx
