{-# LANGUAGE ForeignFunctionInterface #-}

module TD.Lib
  ( create,
    send,
    sendWExtra,
    receive,
    destroy,
    Client,
    Extra,
    ShortShow (shortShow),
    createExtra,
    sendWMyExtra,
  )
where

import Data.Aeson qualified as A
import Data.Aeson.Key qualified as K
import Data.Aeson.KeyMap qualified as KM
import Data.ByteString qualified as B
import Data.ByteString.Lazy qualified as BL
import Data.Hashable qualified as H
import Data.List (intercalate)
import Data.Text qualified as T
import Data.Text.Lazy qualified as TL
import Data.Text.Lazy.Encoding qualified as TL
import Data.Time.Clock.System qualified as Time
import Foreign (Ptr, nullPtr)
import Foreign.C.String (CString)
import TD.GeneralResult (GeneralResult)
import TD.Lib.Internal (Extra (..), ShortShow (shortShow))

foreign import ccall "libtdjson td_json_client_create" c_create :: IO Client

foreign import ccall "libtdjson td_json_client_send" c_send :: Client -> CString -> IO ()

foreign import ccall "libtdjson td_json_client_receive" c_receive :: Client -> Timeout -> IO CString

foreign import ccall "libtdjson td_json_client_destroy" c_destroy :: Client -> IO ()

type Client = Ptr ()

type Timeout = Double

create :: IO Client
create = c_create

send :: (A.ToJSON a) => Client -> a -> IO ()
send client json = B.useAsCString (enc json) (c_send client)
  where
    enc = BL.toStrict . A.encode

sendWExtra :: (A.ToJSON a) => Client -> a -> IO Extra
sendWExtra client json = do
  extra <- createExtra $ A.encode json
  send client (addExtra json extra)
  pure extra

addExtra :: (A.ToJSON a) => a -> Extra -> KM.KeyMap A.Value
addExtra json (Extra extra) =
  case A.toJSON json of
    A.Object t ->
      KM.insert (K.fromString "@extra") (A.String (T.pack extra)) t
    _ ->
      let enc = TL.unpack . TL.decodeUtf8 . A.encode
       in error $ "error. not object: " <> enc extra

sendWMyExtra :: (A.ToJSON a) => Client -> a -> Extra -> IO ()
sendWMyExtra client json extra = send client (addExtra json extra)

createExtra :: (H.Hashable a) => a -> IO Extra
createExtra str = do
  t <- Time.getSystemTime
  let s = Time.systemSeconds t
      ns = Time.systemNanoseconds t
      h = H.hash str
   in pure . Extra $ intercalate "." [show s, show ns, show h]

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
