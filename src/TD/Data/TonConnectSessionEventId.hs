module TD.Data.TonConnectSessionEventId
  (TonConnectSessionEventId(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TonConnectSessionEventId
  = TonConnectSessionEventId -- ^ Represents identifier of an event in a TON Connect session
    { event_id :: Maybe Int -- ^ The event identifier
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectSessionEventId where
  shortShow TonConnectSessionEventId
    { event_id = event_id_
    }
      = "TonConnectSessionEventId"
        ++ I.cc
        [ "event_id" `I.p` event_id_
        ]

instance AT.FromJSON TonConnectSessionEventId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectSessionEventId" -> parseTonConnectSessionEventId v
      _                          -> mempty
    
    where
      parseTonConnectSessionEventId :: A.Value -> AT.Parser TonConnectSessionEventId
      parseTonConnectSessionEventId = A.withObject "TonConnectSessionEventId" $ \o -> do
        event_id_ <- fmap I.readInt64 <$> o A..:?  "event_id"
        pure $ TonConnectSessionEventId
          { event_id = event_id_
          }
  parseJSON _ = mempty

