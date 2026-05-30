module Miso.Effect

public export
Effect : Type -> Type -> Type
Effect model action = IO ()

export
io_ : IO () -> Effect model action
io_ = id

export
pure_ : a -> Effect model action
pure_ _ = pure ()
