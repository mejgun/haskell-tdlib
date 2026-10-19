module TD.Data.TonConnectRequest
  (TonConnectRequest(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

data TonConnectRequest
  = TonConnectRequest -- ^ Represents a pending TON Connect request
    { session_id      :: Maybe Int           -- ^ Unique identifier of the session
    , message_id      :: Maybe Int           -- ^ Unique identifier of the service message in the chat 777000 with the request
    , body            :: Maybe BS.ByteString -- ^ Body of the request
    , expiration_date :: Maybe Int           -- ^ Point in time (Unix timestamp) when the request will expire; 0 if never
    , topic           :: Maybe T.Text        -- ^ Topic of the request; may be empty if none
    , trace_id        :: Maybe T.Text        -- ^ Identifier to trace the request; may be empty if none
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectRequest where
  shortShow TonConnectRequest
    { session_id      = session_id_
    , message_id      = message_id_
    , body            = body_
    , expiration_date = expiration_date_
    , topic           = topic_
    , trace_id        = trace_id_
    }
      = "TonConnectRequest"
        ++ I.cc
        [ "session_id"      `I.p` session_id_
        , "message_id"      `I.p` message_id_
        , "body"            `I.p` body_
        , "expiration_date" `I.p` expiration_date_
        , "topic"           `I.p` topic_
        , "trace_id"        `I.p` trace_id_
        ]

instance AT.FromJSON TonConnectRequest where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectRequest" -> parseTonConnectRequest v
      _                   -> mempty
    
    where
      parseTonConnectRequest :: A.Value -> AT.Parser TonConnectRequest
      parseTonConnectRequest = A.withObject "TonConnectRequest" $ \o -> do
        session_id_      <- fmap I.readInt64 <$> o A..:?  "session_id"
        message_id_      <- o A..:?                       "message_id"
        body_            <- fmap I.readBytes <$> o A..:?  "body"
        expiration_date_ <- o A..:?                       "expiration_date"
        topic_           <- o A..:?                       "topic"
        trace_id_        <- o A..:?                       "trace_id"
        pure $ TonConnectRequest
          { session_id      = session_id_
          , message_id      = message_id_
          , body            = body_
          , expiration_date = expiration_date_
          , topic           = topic_
          , trace_id        = trace_id_
          }
  parseJSON _ = mempty

