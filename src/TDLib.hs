{-# LANGUAGE ForeignFunctionInterface #-}

module TDLib where

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

receive :: Client -> IO CString
receive c = c_receive c 1.0

destroy :: Client -> IO ()
destroy c = c_destroy c

