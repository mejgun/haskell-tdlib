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

import Data.Aeson qualified as A
import Data.Aeson.Key qualified as K
import Data.Aeson.KeyMap qualified as KM
import Data.ByteString qualified as B
import Data.ByteString.Lazy qualified as BL
import Data.Text qualified as T
import Data.Time.Clock.System qualified as Time
import Foreign (Ptr, nullPtr)
import Foreign.C.String (CString)
import Foreign.C.Types ()
import TD.GeneralResult (GeneralResult)
import TD.Lib.Internal (Extra (..))

foreign import ccall "libtdjson td_json_client_create" c_create :: IO Client

foreign import ccall "libtdjson td_json_client_send" c_send :: Client -> CString -> IO ()

foreign import ccall "libtdjson td_json_client_receive" c_receive :: Client -> Timeout -> IO CString

foreign import ccall "libtdjson td_json_client_destroy" c_destroy :: Client -> IO ()

type Client = Ptr ()

type Timeout = Double

create :: IO Client
create = c_create

send :: (A.ToJSON a) => Client -> a -> IO ()
send c d = B.useAsCString enc (c_send c)
  where
    enc = BL.toStrict (A.encode d)

sendWExtra :: (A.ToJSON a) => Client -> a -> IO Extra
sendWExtra c d = do
  extra <- getUnixTime
  B.useAsCString (enc extra) (c_send c)
  pure $ Extra extra
  where
    enc :: String -> B.ByteString
    enc xtr = BL.toStrict $ A.encode (addExtra d xtr)

    addExtra :: (A.ToJSON a) => a -> String -> KM.KeyMap A.Value
    addExtra dd s =
      case A.toJSON dd of
        A.Object t -> KM.insert (K.fromString "@extra") (A.String (T.pack s)) t
        _ -> error $ "error. not object: " <> show (A.encode dd)

    getUnixTime :: IO String
    getUnixTime =
      let s = show . Time.systemSeconds <$> Time.getSystemTime
          ns = show . Time.systemNanoseconds <$> Time.getSystemTime
          str = (++) <$> s <*> ns
       in str

receive :: Client -> IO (Maybe (GeneralResult, Maybe Extra))
receive c = dec $ c_receive c 1.0
  where
    dec :: IO CString -> IO (Maybe (GeneralResult, Maybe Extra))
    dec ics = do
      cs <- ics
      if cs == nullPtr
        then pure Nothing
        else do
          -- B.packCString cs >>= print --DEBUG
          a <- A.decodeStrict <$> B.packCString cs
          case a of
            Nothing -> pure Nothing
            (Just r) -> do
              b <- A.decodeStrict <$> B.packCString cs
              pure $ Just (r, b)

destroy :: Client -> IO ()
destroy = c_destroy
