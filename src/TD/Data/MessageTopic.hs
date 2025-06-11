module TD.Data.MessageTopic
  (MessageTopic(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a topic of messages in a chat
data MessageTopic
  = MessageTopicForum -- ^ A topic in a forum supergroup chat
    { forum_topic_id :: Maybe Int -- ^ Unique identifier of the forum topic; all messages in a non-forum supergroup chats belongs to the General topic
    }
  | MessageTopicDirectMessages -- ^ A topic in a channel direct messages chat administered by the current user
    { direct_messages_chat_topic_id :: Maybe Int -- ^ Unique identifier of the topic
    }
  | MessageTopicSavedMessages -- ^ A topic in Saved Messages chat
    { saved_messages_topic_id :: Maybe Int -- ^ Unique identifier of the Saved Messages topic
    }
  deriving (Eq, Show)

instance I.ShortShow MessageTopic where
  shortShow MessageTopicForum
    { forum_topic_id = forum_topic_id_
    }
      = "MessageTopicForum"
        ++ I.cc
        [ "forum_topic_id" `I.p` forum_topic_id_
        ]
  shortShow MessageTopicDirectMessages
    { direct_messages_chat_topic_id = direct_messages_chat_topic_id_
    }
      = "MessageTopicDirectMessages"
        ++ I.cc
        [ "direct_messages_chat_topic_id" `I.p` direct_messages_chat_topic_id_
        ]
  shortShow MessageTopicSavedMessages
    { saved_messages_topic_id = saved_messages_topic_id_
    }
      = "MessageTopicSavedMessages"
        ++ I.cc
        [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
        ]

instance AT.FromJSON MessageTopic where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageTopicForum"          -> parseMessageTopicForum v
      "messageTopicDirectMessages" -> parseMessageTopicDirectMessages v
      "messageTopicSavedMessages"  -> parseMessageTopicSavedMessages v
      _                            -> mempty
    
    where
      parseMessageTopicForum :: A.Value -> AT.Parser MessageTopic
      parseMessageTopicForum = A.withObject "MessageTopicForum" $ \o -> do
        forum_topic_id_ <- o A..:?  "forum_topic_id"
        pure $ MessageTopicForum
          { forum_topic_id = forum_topic_id_
          }
      parseMessageTopicDirectMessages :: A.Value -> AT.Parser MessageTopic
      parseMessageTopicDirectMessages = A.withObject "MessageTopicDirectMessages" $ \o -> do
        direct_messages_chat_topic_id_ <- o A..:?  "direct_messages_chat_topic_id"
        pure $ MessageTopicDirectMessages
          { direct_messages_chat_topic_id = direct_messages_chat_topic_id_
          }
      parseMessageTopicSavedMessages :: A.Value -> AT.Parser MessageTopic
      parseMessageTopicSavedMessages = A.withObject "MessageTopicSavedMessages" $ \o -> do
        saved_messages_topic_id_ <- o A..:?  "saved_messages_topic_id"
        pure $ MessageTopicSavedMessages
          { saved_messages_topic_id = saved_messages_topic_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageTopic where
  toJSON MessageTopicForum
    { forum_topic_id = forum_topic_id_
    }
      = A.object
        [ "@type"          A..= AT.String "messageTopicForum"
        , "forum_topic_id" A..= forum_topic_id_
        ]
  toJSON MessageTopicDirectMessages
    { direct_messages_chat_topic_id = direct_messages_chat_topic_id_
    }
      = A.object
        [ "@type"                         A..= AT.String "messageTopicDirectMessages"
        , "direct_messages_chat_topic_id" A..= direct_messages_chat_topic_id_
        ]
  toJSON MessageTopicSavedMessages
    { saved_messages_topic_id = saved_messages_topic_id_
    }
      = A.object
        [ "@type"                   A..= AT.String "messageTopicSavedMessages"
        , "saved_messages_topic_id" A..= saved_messages_topic_id_
        ]

