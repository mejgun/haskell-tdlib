-- {-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module TD.Lib
  ( create,
    send,
    sendWExtra,
    receive,
    destroy,
    Client,
  )
where

import qualified Data.Aeson as A
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.HashMap.Strict as H
import qualified Data.Text as T
import qualified Data.Time.Clock.System as Time
import Foreign
import Foreign.C.String
import Foreign.C.Types
import TD.Data.GeneralResult as GeneralResult

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

sendWExtra :: (A.ToJSON a) => Client -> a -> IO String
sendWExtra c d = do
  extra <- getUnixTime
  B.useAsCString (enc extra) (c_send c)
  return extra
  where
    enc :: String -> B.ByteString
    enc xtr = do
      BL.toStrict $ A.encode (addExtra d xtr)
    addExtra :: (A.ToJSON a) => a -> String -> H.HashMap T.Text A.Value
    addExtra d s = do
      let A.Object t = A.toJSON d
      H.insert (T.pack "@extra") (A.String (T.pack s)) t
    getUnixTime :: IO String
    getUnixTime = do
      let s = show <$> Time.systemSeconds <$> Time.getSystemTime
      let ns = show <$> Time.systemNanoseconds <$> Time.getSystemTime
      let str = (++) <$> s <*> ns
      str

-- execute :: Client -> String -> IO ()
-- execute c s = (newCString s) >>= c_execute c

receive :: Client -> IO (Maybe GeneralResult.ResultWithExtra)
receive c = dec $ c_receive c 1.0
  where
    dec :: IO CString -> IO (Maybe GeneralResult.ResultWithExtra)
    dec ics = do
      cs <- ics
      if cs == nullPtr
        then return Nothing
        else do
          -- B.packCString cs >>= print --DEBUG
          A.decodeStrict <$> B.packCString cs

destroy :: Client -> IO ()
destroy c = c_destroy c
