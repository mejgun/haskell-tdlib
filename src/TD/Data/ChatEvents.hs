{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatEvents where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatEvent as ChatEvent
import qualified Utils as U

data ChatEvents = -- | Contains a list of chat events @events List of events
  ChatEvents
  { -- |
    events :: Maybe [ChatEvent.ChatEvent]
  }
  deriving (Eq)

instance Show ChatEvents where
  show
    ChatEvents
      { events = events
      } =
      "ChatEvents"
        ++ U.cc
          [ U.p "events" events
          ]

instance T.FromJSON ChatEvents where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatEvents" -> parseChatEvents v
      _ -> mempty
    where
      parseChatEvents :: A.Value -> T.Parser ChatEvents
      parseChatEvents = A.withObject "ChatEvents" $ \o -> do
        events_ <- o A..:? "events"
        return $ ChatEvents {events = events_}
  parseJSON _ = mempty

instance T.ToJSON ChatEvents where
  toJSON
    ChatEvents
      { events = events
      } =
      A.object
        [ "@type" A..= T.String "chatEvents",
          "events" A..= events
        ]
