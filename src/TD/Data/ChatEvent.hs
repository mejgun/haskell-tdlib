module TD.Data.ChatEvent
  (ChatEvent(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ChatEventAction as ChatEventAction

data ChatEvent
  = ChatEvent -- ^ Represents a chat event
    { _id       :: Maybe Int                             -- ^ Chat event identifier
    , date      :: Maybe Int                             -- ^ Point in time (Unix timestamp) when the event happened
    , member_id :: Maybe MessageSender.MessageSender     -- ^ Identifier of the user or chat who performed the action
    , action    :: Maybe ChatEventAction.ChatEventAction -- ^ The action
    }
  deriving (Eq, Show)

instance I.ShortShow ChatEvent where
  shortShow ChatEvent
    { _id       = _id_
    , date      = date_
    , member_id = member_id_
    , action    = action_
    }
      = "ChatEvent"
        ++ I.cc
        [ "_id"       `I.p` _id_
        , "date"      `I.p` date_
        , "member_id" `I.p` member_id_
        , "action"    `I.p` action_
        ]

instance AT.FromJSON ChatEvent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatEvent" -> parseChatEvent v
      _           -> mempty
    
    where
      parseChatEvent :: A.Value -> AT.Parser ChatEvent
      parseChatEvent = A.withObject "ChatEvent" $ \o -> do
        _id_       <- fmap I.readInt64 <$> o A..:?  "id"
        date_      <- o A..:?                       "date"
        member_id_ <- o A..:?                       "member_id"
        action_    <- o A..:?                       "action"
        pure $ ChatEvent
          { _id       = _id_
          , date      = date_
          , member_id = member_id_
          , action    = action_
          }
  parseJSON _ = mempty

