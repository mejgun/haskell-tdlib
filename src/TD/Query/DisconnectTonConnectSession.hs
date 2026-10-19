module TD.Query.DisconnectTonConnectSession
  (DisconnectTonConnectSession(..)
  , defaultDisconnectTonConnectSession
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Closes a TON Connect session. Returns 'TD.Data.Ok.Ok'
data DisconnectTonConnectSession
  = DisconnectTonConnectSession
    { session_id :: Maybe Int           -- ^ Unique identifier of the TON Connect session to close
    , body       :: Maybe BS.ByteString -- ^ Encrypted body of the disconnect event; may be empty if the session has already been closed. Use getTonConnectSessionNextEventId to get event identifier for the event
    }
  deriving (Eq, Show)

instance I.ShortShow DisconnectTonConnectSession where
  shortShow
    DisconnectTonConnectSession
      { session_id = session_id_
      , body       = body_
      }
        = "DisconnectTonConnectSession"
          ++ I.cc
          [ "session_id" `I.p` session_id_
          , "body"       `I.p` body_
          ]

instance AT.ToJSON DisconnectTonConnectSession where
  toJSON
    DisconnectTonConnectSession
      { session_id = session_id_
      , body       = body_
      }
        = A.object
          [ "@type"      A..= AT.String "disconnectTonConnectSession"
          , "session_id" A..= fmap I.writeInt64  session_id_
          , "body"       A..= fmap I.writeBytes  body_
          ]

defaultDisconnectTonConnectSession :: DisconnectTonConnectSession
defaultDisconnectTonConnectSession =
  DisconnectTonConnectSession
    { session_id = Nothing
    , body       = Nothing
    }

