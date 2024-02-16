module TD.Data.InputMessageReplyTo
  (InputMessageReplyTo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputTextQuote as InputTextQuote

-- | Contains information about the message or the story to be replied
data InputMessageReplyTo
  = InputMessageReplyToMessage -- ^ Describes a message to be replied
    { chat_id    :: Maybe Int                           -- ^ The identifier of the chat to which the message to be replied belongs; pass 0 if the message to be replied is in the same chat. Must always be 0 for replies in secret chats. A message can be replied in another chat or topic only if message.can_be_replied_in_another_chat
    , message_id :: Maybe Int                           -- ^ The identifier of the message to be replied in the same or the specified chat
    , quote      :: Maybe InputTextQuote.InputTextQuote -- ^ Quote from the message to be replied; pass null if none. Must always be null for replies in secret chats
    }
  | InputMessageReplyToStory -- ^ Describes a story to be replied
    { story_sender_chat_id :: Maybe Int -- ^ The identifier of the sender of the story. Currently, stories can be replied only in the sender's chat and channel stories can't be replied
    , story_id             :: Maybe Int -- ^ The identifier of the story
    }
  deriving (Eq, Show)

instance I.ShortShow InputMessageReplyTo where
  shortShow InputMessageReplyToMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    , quote      = quote_
    }
      = "InputMessageReplyToMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        , "quote"      `I.p` quote_
        ]
  shortShow InputMessageReplyToStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = "InputMessageReplyToStory"
        ++ I.cc
        [ "story_sender_chat_id" `I.p` story_sender_chat_id_
        , "story_id"             `I.p` story_id_
        ]

instance AT.FromJSON InputMessageReplyTo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputMessageReplyToMessage" -> parseInputMessageReplyToMessage v
      "inputMessageReplyToStory"   -> parseInputMessageReplyToStory v
      _                            -> mempty
    
    where
      parseInputMessageReplyToMessage :: A.Value -> AT.Parser InputMessageReplyTo
      parseInputMessageReplyToMessage = A.withObject "InputMessageReplyToMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        quote_      <- o A..:?  "quote"
        pure $ InputMessageReplyToMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          , quote      = quote_
          }
      parseInputMessageReplyToStory :: A.Value -> AT.Parser InputMessageReplyTo
      parseInputMessageReplyToStory = A.withObject "InputMessageReplyToStory" $ \o -> do
        story_sender_chat_id_ <- o A..:?  "story_sender_chat_id"
        story_id_             <- o A..:?  "story_id"
        pure $ InputMessageReplyToStory
          { story_sender_chat_id = story_sender_chat_id_
          , story_id             = story_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputMessageReplyTo where
  toJSON InputMessageReplyToMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    , quote      = quote_
    }
      = A.object
        [ "@type"      A..= AT.String "inputMessageReplyToMessage"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        , "quote"      A..= quote_
        ]
  toJSON InputMessageReplyToStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = A.object
        [ "@type"                A..= AT.String "inputMessageReplyToStory"
        , "story_sender_chat_id" A..= story_sender_chat_id_
        , "story_id"             A..= story_id_
        ]

