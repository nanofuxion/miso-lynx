module Miso.Lynx.Event

import Miso.Lynx.Element.Image.Event
import Miso.Lynx.Element.List.Event
import Miso.Lynx.Element.ScrollView.Event
import Miso.Lynx.Element.Text.Event
import Miso.Lynx.Element.View.Event
import Miso.Event

export
lynxEvents : Events
lynxEvents =
  imageEvents ++ listEvents ++ scrollViewEvents ++ textEvents ++ viewEvents
