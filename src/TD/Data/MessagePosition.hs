module TD.Data.MessagePosition
  (MessagePosition(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data MessagePosition
  = MessagePosition -- ^ Contains information about a message in a specific position
    { position   :: Maybe Int -- ^ 0-based message position in the full list of suitable messages
    , message_id :: Maybe Int -- ^ Message identifier
    , date       :: Maybe Int -- ^ Point in time (Unix timestamp) when the message was sent
    }
  deriving (Eq, Show)

instance I.ShortShow MessagePosition where
  shortShow MessagePosition
    { position   = position_
    , message_id = message_id_
    , date       = date_
    }
      = "MessagePosition"
        ++ I.cc
        [ "position"   `I.p` position_
        , "message_id" `I.p` message_id_
        , "date"       `I.p` date_
        ]

instance AT.FromJSON MessagePosition where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messagePosition" -> parseMessagePosition v
      _                 -> mempty
    
    where
      parseMessagePosition :: A.Value -> AT.Parser MessagePosition
      parseMessagePosition = A.withObject "MessagePosition" $ \o -> do
        position_   <- o A..:?  "position"
        message_id_ <- o A..:?  "message_id"
        date_       <- o A..:?  "date"
        pure $ MessagePosition
          { position   = position_
          , message_id = message_id_
          , date       = date_
          }
  parseJSON _ = mempty

