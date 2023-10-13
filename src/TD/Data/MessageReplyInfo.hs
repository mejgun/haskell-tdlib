module TD.Data.MessageReplyInfo
  ( MessageReplyInfo(..)    
  , defaultMessageReplyInfo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data MessageReplyInfo
  = MessageReplyInfo -- ^ Contains information about replies to a message
    { reply_count                 :: Maybe Int                           -- ^ Number of times the message was directly or indirectly replied
    , recent_replier_ids          :: Maybe [MessageSender.MessageSender] -- ^ Identifiers of at most 3 recent repliers to the message; available in channels with a discussion supergroup. The users and chats are expected to be inaccessible: only their photo and name will be available
    , last_read_inbox_message_id  :: Maybe Int                           -- ^ Identifier of the last read incoming reply to the message
    , last_read_outbox_message_id :: Maybe Int                           -- ^ Identifier of the last read outgoing reply to the message
    , last_message_id             :: Maybe Int                           -- ^ Identifier of the last reply to the message
    }
  deriving (Eq)

instance Show MessageReplyInfo where
  show MessageReplyInfo
    { reply_count                 = reply_count_
    , recent_replier_ids          = recent_replier_ids_
    , last_read_inbox_message_id  = last_read_inbox_message_id_
    , last_read_outbox_message_id = last_read_outbox_message_id_
    , last_message_id             = last_message_id_
    }
      = "MessageReplyInfo"
        ++ I.cc
        [ "reply_count"                 `I.p` reply_count_
        , "recent_replier_ids"          `I.p` recent_replier_ids_
        , "last_read_inbox_message_id"  `I.p` last_read_inbox_message_id_
        , "last_read_outbox_message_id" `I.p` last_read_outbox_message_id_
        , "last_message_id"             `I.p` last_message_id_
        ]

instance AT.FromJSON MessageReplyInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageReplyInfo" -> parseMessageReplyInfo v
      _                  -> mempty
    
    where
      parseMessageReplyInfo :: A.Value -> AT.Parser MessageReplyInfo
      parseMessageReplyInfo = A.withObject "MessageReplyInfo" $ \o -> do
        reply_count_                 <- o A..:?  "reply_count"
        recent_replier_ids_          <- o A..:?  "recent_replier_ids"
        last_read_inbox_message_id_  <- o A..:?  "last_read_inbox_message_id"
        last_read_outbox_message_id_ <- o A..:?  "last_read_outbox_message_id"
        last_message_id_             <- o A..:?  "last_message_id"
        pure $ MessageReplyInfo
          { reply_count                 = reply_count_
          , recent_replier_ids          = recent_replier_ids_
          , last_read_inbox_message_id  = last_read_inbox_message_id_
          , last_read_outbox_message_id = last_read_outbox_message_id_
          , last_message_id             = last_message_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageReplyInfo where
  toJSON MessageReplyInfo
    { reply_count                 = reply_count_
    , recent_replier_ids          = recent_replier_ids_
    , last_read_inbox_message_id  = last_read_inbox_message_id_
    , last_read_outbox_message_id = last_read_outbox_message_id_
    , last_message_id             = last_message_id_
    }
      = A.object
        [ "@type"                       A..= AT.String "messageReplyInfo"
        , "reply_count"                 A..= reply_count_
        , "recent_replier_ids"          A..= recent_replier_ids_
        , "last_read_inbox_message_id"  A..= last_read_inbox_message_id_
        , "last_read_outbox_message_id" A..= last_read_outbox_message_id_
        , "last_message_id"             A..= last_message_id_
        ]

defaultMessageReplyInfo :: MessageReplyInfo
defaultMessageReplyInfo =
  MessageReplyInfo
    { reply_count                 = Nothing
    , recent_replier_ids          = Nothing
    , last_read_inbox_message_id  = Nothing
    , last_read_outbox_message_id = Nothing
    , last_message_id             = Nothing
    }

