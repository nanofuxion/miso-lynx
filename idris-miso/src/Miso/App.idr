module Miso.App

import Miso.Types

public export
record Component model action where
  constructor MkComponent
  initModel : model
  update : action -> model -> model
  view : model -> View action

public export
App : Type -> Type -> Type
App model action = Component model action

export
component : model -> (action -> model -> model) -> (model -> View action) -> App model action
component init upd vw = MkComponent init upd vw
