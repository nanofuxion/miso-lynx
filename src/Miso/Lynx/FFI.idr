module Miso.Lynx.FFI

%foreign "javascript:lambda:(d,f)=>lynx.setInterval(()=>f(),d)"
prim__setInterval : (PrimIO ()) -> Double -> PrimIO Double

export
setInterval : Double -> IO () -> IO Double
setInterval delay act = primIO (prim__setInterval (toPrim act) delay)

%foreign "javascript:lambda:(id)=>lynx.clearInterval(id)"
prim__clearInterval : Double -> PrimIO Double

export
clearInterval : Double -> IO Double
clearInterval = primIO . prim__clearInterval

%foreign "javascript:lambda:(d,f)=>lynx.setTimeout(()=>f(),d)"
prim__setTimeout : (PrimIO ()) -> Double -> PrimIO Double

export
setTimeout : Double -> IO () -> IO Double
setTimeout delay act = primIO (prim__setTimeout (toPrim act) delay)

%foreign "javascript:lambda:(id)=>lynx.clearTimeout(id)"
prim__clearTimeout : Double -> PrimIO ()

export
clearTimeout : Double -> IO ()
clearTimeout id = primIO (prim__clearTimeout id)

%foreign "javascript:lambda:(sel,meth,success,fail)=>globalThis.invokeExec(sel,meth,{},()=>success(),fail)"
prim__invokeExec : String -> String -> (PrimIO ()) -> (String -> PrimIO ()) -> PrimIO ()

export
invokeExec : String -> String -> IO () -> (String -> IO ()) -> IO ()
invokeExec selector method onSuccess onFail =
  primIO (prim__invokeExec selector method (toPrim onSuccess) (\s => toPrim (onFail s)))
