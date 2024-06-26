port module Port exposing (onPointerMove, onPointerUp, releasePointerCapture)

import Json.Encode


port onPointerMove : (Json.Encode.Value -> msg) -> Sub msg


port onPointerUp : (Json.Encode.Value -> msg) -> Sub msg


port releasePointerCapture : Json.Encode.Value -> Cmd msg
