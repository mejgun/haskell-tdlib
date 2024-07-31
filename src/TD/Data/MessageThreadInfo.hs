module TD.Data.MessageThreadInfo
  (MessageThreadInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageReplyInfo as MessageReplyInfo
import qualified TD.Data.Message as Message
import qualified TD.Data.DraftMessage as DraftMessage

data MessageThreadInfo
  = MessageThreadInfo -- ^ Contains information about a message thread
    { chat_id              :: Maybe Int                               -- ^ Identifier of the chat to which the message thread belongs
    , message_thread_id    :: Maybe Int                               -- ^ Message thread identifier, unique within the chat
    , reply_info           :: Maybe MessageReplyInfo.MessageReplyInfo -- ^ Information about the message thread; may be null for forum topic threads
    , unread_message_count :: Maybe Int                               -- ^ Approximate number of unread messages in the message thread
    , messages             :: Maybe [Message.Message]                 -- ^ The messages from which the thread starts. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id)
    , draft_message        :: Maybe DraftMessage.DraftMessage         -- ^ A draft of a message in the message thread; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow MessageThreadInfo where
  shortShow MessageThreadInfo
    { chat_id              = chat_id_
    , message_thread_id    = message_thread_id_
    , reply_info           = reply_info_
    , unread_message_count = unread_message_count_
    , messages             = messages_
    , draft_message        = draft_message_
    }
      = "MessageThreadInfo"
        ++ I.cc
        [ "chat_id"              `I.p` chat_id_
        , "message_thread_id"    `I.p` message_thread_id_
        , "reply_info"           `I.p` reply_info_
        , "unread_message_count" `I.p` unread_message_count_
        , "messages"             `I.p` messages_
        , "draft_message"        `I.p` draft_message_
        ]

instance AT.FromJSON MessageThreadInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageThreadInfo" -> parseMessageThreadInfo v
      _                   -> mempty
    
    where
      parseMessageThreadInfo :: A.Value -> AT.Parser MessageThreadInfo
      parseMessageThreadInfo = A.withObject "MessageThreadInfo" $ \o -> do
        chat_id_              <- o A..:?  "chat_id"
        message_thread_id_    <- o A..:?  "message_thread_id"
        reply_info_           <- o A..:?  "reply_info"
        unread_message_count_ <- o A..:?  "unread_message_count"
        messages_             <- o A..:?  "messages"
        draft_message_        <- o A..:?  "draft_message"
        pure $ MessageThreadInfo
          { chat_id              = chat_id_
          , message_thread_id    = message_thread_id_
          , reply_info           = reply_info_
          , unread_message_count = unread_message_count_
          , messages             = messages_
          , draft_message        = draft_message_
          }
  parseJSON _ = mempty

