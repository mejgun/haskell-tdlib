module TD.Data.MessageReplyTo
  ( MessageReplyTo(..)           
  , defaultMessageReplyToMessage 
  , defaultMessageReplyToStory   
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data MessageReplyTo -- ^ Contains information about the message or the story a message is replying to
  = MessageReplyToMessage -- ^ Describes a replied message
    { chat_id    :: Maybe Int -- ^ The identifier of the chat to which the replied message belongs; ignored for outgoing replies. For example, messages in the Replies chat are replies to messages in different chats
    , message_id :: Maybe Int -- ^ The identifier of the replied message
    }
  | MessageReplyToStory -- ^ Describes a replied story
    { story_sender_chat_id :: Maybe Int -- ^ The identifier of the sender of the replied story. Currently, stories can be replied only in the sender's chat
    , story_id             :: Maybe Int -- ^ The identifier of the replied story
    }
  deriving (Eq)

instance Show MessageReplyTo where
  show MessageReplyToMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "MessageReplyToMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  show MessageReplyToStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = "MessageReplyToStory"
        ++ I.cc
        [ "story_sender_chat_id" `I.p` story_sender_chat_id_
        , "story_id"             `I.p` story_id_
        ]

instance AT.FromJSON MessageReplyTo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageReplyToMessage" -> parseMessageReplyToMessage v
      "messageReplyToStory"   -> parseMessageReplyToStory v
      _                       -> mempty
    
    where
      parseMessageReplyToMessage :: A.Value -> AT.Parser MessageReplyTo
      parseMessageReplyToMessage = A.withObject "MessageReplyToMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ MessageReplyToMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseMessageReplyToStory :: A.Value -> AT.Parser MessageReplyTo
      parseMessageReplyToStory = A.withObject "MessageReplyToStory" $ \o -> do
        story_sender_chat_id_ <- o A..:?  "story_sender_chat_id"
        story_id_             <- o A..:?  "story_id"
        pure $ MessageReplyToStory
          { story_sender_chat_id = story_sender_chat_id_
          , story_id             = story_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageReplyTo where
  toJSON MessageReplyToMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "messageReplyToMessage"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]
  toJSON MessageReplyToStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = A.object
        [ "@type"                A..= AT.String "messageReplyToStory"
        , "story_sender_chat_id" A..= story_sender_chat_id_
        , "story_id"             A..= story_id_
        ]

defaultMessageReplyToMessage :: MessageReplyTo
defaultMessageReplyToMessage =
  MessageReplyToMessage
    { chat_id    = Nothing
    , message_id = Nothing
    }

defaultMessageReplyToStory :: MessageReplyTo
defaultMessageReplyToStory =
  MessageReplyToStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    }

