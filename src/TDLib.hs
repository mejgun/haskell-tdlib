{-# LANGUAGE ForeignFunctionInterface #-}

module TDLib where

import           API.GeneralResult

import           Foreign
import           Foreign.C.String
import           Foreign.C.Types

import qualified Data.Aeson                    as A
import qualified Data.ByteString               as B
import qualified Data.ByteString.Lazy          as BL

foreign import ccall "libtdjson td_json_client_create" c_create :: IO Client
foreign import ccall "libtdjson td_json_client_send" c_send :: Client -> CString -> IO ()
foreign import ccall "libtdjson td_json_client_receive" c_receive :: Client -> Timeout -> IO CString
--foreign import ccall "libtdjson td_json_client_execute" c_execute :: Client -> CString -> IO ()
foreign import ccall "libtdjson td_json_client_destroy" c_destroy :: Client -> IO ()

type Client = Ptr ()
type Timeout = Double

create :: IO Client
create = c_create

send :: (A.ToJSON a) => Client -> a -> IO ()
send c d = B.useAsCString enc (c_send c) where enc = BL.toStrict (A.encode d)

-- execute :: Client -> String -> IO ()
-- execute c s = (newCString s) >>= c_execute c

receive :: Client -> IO (Maybe API.GeneralResult.GeneralResult)
receive c = dec $ c_receive c 1.0
 where
  dec :: IO CString -> IO (Maybe API.GeneralResult.GeneralResult)
  dec ics = do
    cs <- ics
    if cs == nullPtr
      then return Nothing
      else A.decodeStrict <$> B.packCString cs

destroy :: Client -> IO ()
destroy c = c_destroy c

