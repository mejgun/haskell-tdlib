{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE OverloadedStrings #-}


module Main where

import           Foreign
import           Foreign.C.String
import           Foreign.C.Types

import           API.GeneralResult
-- import           API.Ok
import           API.Functions.SetLogVerbosityLevel
import           Data.Aeson
import qualified Data.ByteString               as B
import qualified Data.ByteString.Lazy          as BL

foreign import ccall "libtdjson td_json_client_create" c_create :: IO Client
foreign import ccall "libtdjson td_json_client_send" c_send :: Client -> CString -> IO ()
foreign import ccall "libtdjson td_json_client_receive" c_receive :: Client -> Timeout -> IO CString
foreign import ccall "libtdjson td_json_client_execute" c_execute :: Client -> CString -> IO ()
foreign import ccall "libtdjson td_json_client_destroy" c_destroy :: Client -> IO ()

type Client = Ptr ()
type Timeout = Double

-- main :: IO ()
-- main = do
--   let k = API.Ok.Ok
--   --let k = API.Messages.Messages { API.Messages.messages    = []
--                                 --, API.Messages.total_count = 998
--                                 --}
--   let t = encode k
--   print t
--   let m = decode t :: Maybe API.GeneralResult.GeneralResult
--   print m

--   putStrLn "ok"

main :: IO ()
main = do
  client <- create
  --send client testQuery1
  --execute client testQuery2
  send
    client
    (encode API.Functions.SetLogVerbosityLevel.SetLogVerbosityLevel
      { new_verbosity_level = 2
      }
    )
  live client
  destroy client
 where
  live c = do
    cs <- receive c
    if cs /= nullPtr
      then do
        is <- B.packCString cs
        let j =
              decode (BL.fromStrict is) :: Maybe API.GeneralResult.GeneralResult
        print j
      else return ()
    live c



create :: IO Client
create = c_create

send :: Client -> BL.ByteString -> IO ()
send c s = B.useAsCString (BL.toStrict s) (c_send c)

-- execute :: Client -> String -> IO ()
-- execute c s = (newCString s) >>= c_execute c

receive :: Client -> IO CString
receive c = c_receive c 1.0

destroy :: Client -> IO ()
destroy c = c_destroy c

