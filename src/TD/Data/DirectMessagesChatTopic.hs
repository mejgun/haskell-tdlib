module TD.Data.DirectMessagesChatTopic
  (DirectMessagesChatTopic(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.Message as Message
import qualified TD.Data.DraftMessage as DraftMessage

data DirectMessagesChatTopic
  = DirectMessagesChatTopic -- ^ Contains information about a topic in a channel direct messages chat administered by the current user
    { chat_id                     :: Maybe Int                         -- ^ Identifier of the chat to which the topic belongs
    , _id                         :: Maybe Int                         -- ^ Unique topic identifier
    , sender_id                   :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or chat that sends the messages to the topic
    , order                       :: Maybe Int                         -- ^ A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
    , can_send_unpaid_messages    :: Maybe Bool                        -- ^ True, if the other party can send unpaid messages even if the chat has paid messages enabled
    , is_marked_as_unread         :: Maybe Bool                        -- ^ True, if the forum topic is marked as unread
    , unread_count                :: Maybe Int                         -- ^ Number of unread messages in the chat
    , last_read_inbox_message_id  :: Maybe Int                         -- ^ Identifier of the last read incoming message
    , last_read_outbox_message_id :: Maybe Int                         -- ^ Identifier of the last read outgoing message
    , unread_reaction_count       :: Maybe Int                         -- ^ Number of messages with unread reactions in the chat
    , last_message                :: Maybe Message.Message             -- ^ Last message in the topic; may be null if none or unknown
    , draft_message               :: Maybe DraftMessage.DraftMessage   -- ^ A draft of a message in the topic; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow DirectMessagesChatTopic where
  shortShow DirectMessagesChatTopic
    { chat_id                     = chat_id_
    , _id                         = _id_
    , sender_id                   = sender_id_
    , order                       = order_
    , can_send_unpaid_messages    = can_send_unpaid_messages_
    , is_marked_as_unread         = is_marked_as_unread_
    , unread_count                = unread_count_
    , last_read_inbox_message_id  = last_read_inbox_message_id_
    , last_read_outbox_message_id = last_read_outbox_message_id_
    , unread_reaction_count       = unread_reaction_count_
    , last_message                = last_message_
    , draft_message               = draft_message_
    }
      = "DirectMessagesChatTopic"
        ++ I.cc
        [ "chat_id"                     `I.p` chat_id_
        , "_id"                         `I.p` _id_
        , "sender_id"                   `I.p` sender_id_
        , "order"                       `I.p` order_
        , "can_send_unpaid_messages"    `I.p` can_send_unpaid_messages_
        , "is_marked_as_unread"         `I.p` is_marked_as_unread_
        , "unread_count"                `I.p` unread_count_
        , "last_read_inbox_message_id"  `I.p` last_read_inbox_message_id_
        , "last_read_outbox_message_id" `I.p` last_read_outbox_message_id_
        , "unread_reaction_count"       `I.p` unread_reaction_count_
        , "last_message"                `I.p` last_message_
        , "draft_message"               `I.p` draft_message_
        ]

instance AT.FromJSON DirectMessagesChatTopic where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "directMessagesChatTopic" -> parseDirectMessagesChatTopic v
      _                         -> mempty
    
    where
      parseDirectMessagesChatTopic :: A.Value -> AT.Parser DirectMessagesChatTopic
      parseDirectMessagesChatTopic = A.withObject "DirectMessagesChatTopic" $ \o -> do
        chat_id_                     <- o A..:?                       "chat_id"
        _id_                         <- o A..:?                       "id"
        sender_id_                   <- o A..:?                       "sender_id"
        order_                       <- fmap I.readInt64 <$> o A..:?  "order"
        can_send_unpaid_messages_    <- o A..:?                       "can_send_unpaid_messages"
        is_marked_as_unread_         <- o A..:?                       "is_marked_as_unread"
        unread_count_                <- o A..:?                       "unread_count"
        last_read_inbox_message_id_  <- o A..:?                       "last_read_inbox_message_id"
        last_read_outbox_message_id_ <- o A..:?                       "last_read_outbox_message_id"
        unread_reaction_count_       <- o A..:?                       "unread_reaction_count"
        last_message_                <- o A..:?                       "last_message"
        draft_message_               <- o A..:?                       "draft_message"
        pure $ DirectMessagesChatTopic
          { chat_id                     = chat_id_
          , _id                         = _id_
          , sender_id                   = sender_id_
          , order                       = order_
          , can_send_unpaid_messages    = can_send_unpaid_messages_
          , is_marked_as_unread         = is_marked_as_unread_
          , unread_count                = unread_count_
          , last_read_inbox_message_id  = last_read_inbox_message_id_
          , last_read_outbox_message_id = last_read_outbox_message_id_
          , unread_reaction_count       = unread_reaction_count_
          , last_message                = last_message_
          , draft_message               = draft_message_
          }
  parseJSON _ = mempty

