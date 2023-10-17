module TD.Data.ChatEvents
  (ChatEvents(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatEvent as ChatEvent

data ChatEvents
  = ChatEvents -- ^ Contains a list of chat events
    { events :: Maybe [ChatEvent.ChatEvent] -- ^ List of events
    }
  deriving (Eq, Show)

instance I.ShortShow ChatEvents where
  shortShow ChatEvents
    { events = events_
    }
      = "ChatEvents"
        ++ I.cc
        [ "events" `I.p` events_
        ]

instance AT.FromJSON ChatEvents where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatEvents" -> parseChatEvents v
      _            -> mempty
    
    where
      parseChatEvents :: A.Value -> AT.Parser ChatEvents
      parseChatEvents = A.withObject "ChatEvents" $ \o -> do
        events_ <- o A..:?  "events"
        pure $ ChatEvents
          { events = events_
          }
  parseJSON _ = mempty

