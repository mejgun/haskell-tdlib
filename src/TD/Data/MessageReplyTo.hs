module TD.Data.MessageReplyTo
  (MessageReplyTo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TextQuote as TextQuote
import qualified TD.Data.MessageOrigin as MessageOrigin
import qualified TD.Data.MessageContent as MessageContent

-- | Contains information about the message or the story a message is replying to
data MessageReplyTo
  = MessageReplyToMessage -- ^ Describes a message replied by a given message
    { chat_id           :: Maybe Int                           -- ^ The identifier of the chat to which the message belongs; may be 0 if the replied message is in unknown chat
    , message_id        :: Maybe Int                           -- ^ The identifier of the message; may be 0 if the replied message is in unknown chat
    , quote             :: Maybe TextQuote.TextQuote           -- ^ Chosen quote from the replied message; may be null if none
    , checklist_task_id :: Maybe Int                           -- ^ Identifier of the checklist task in the original message that was replied; 0 if none
    , origin            :: Maybe MessageOrigin.MessageOrigin   -- ^ Information about origin of the message if the message was from another chat or topic; may be null for messages from the same chat
    , origin_send_date  :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the message was sent if the message was from another chat or topic; 0 for messages from the same chat
    , content           :: Maybe MessageContent.MessageContent -- ^ Media content of the message if the message was from another chat or topic; may be null for messages from the same chat and messages without media. Can be only one of the following types: messageAnimation, messageAudio, messageChecklist, messageContact, messageDice, messageDocument, messageGame, messageGiveaway, messageGiveawayWinners, messageInvoice, messageLocation, messagePaidMedia, messagePhoto, messagePoll, messageSticker, messageStory, messageText (for link preview), messageVenue, messageVideo, messageVideoNote, or messageVoiceNote
    }
  | MessageReplyToStory -- ^ Describes a story replied by a given message
    { story_poster_chat_id :: Maybe Int -- ^ The identifier of the poster of the story
    , story_id             :: Maybe Int -- ^ The identifier of the story
    }
  deriving (Eq, Show)

instance I.ShortShow MessageReplyTo where
  shortShow MessageReplyToMessage
    { chat_id           = chat_id_
    , message_id        = message_id_
    , quote             = quote_
    , checklist_task_id = checklist_task_id_
    , origin            = origin_
    , origin_send_date  = origin_send_date_
    , content           = content_
    }
      = "MessageReplyToMessage"
        ++ I.cc
        [ "chat_id"           `I.p` chat_id_
        , "message_id"        `I.p` message_id_
        , "quote"             `I.p` quote_
        , "checklist_task_id" `I.p` checklist_task_id_
        , "origin"            `I.p` origin_
        , "origin_send_date"  `I.p` origin_send_date_
        , "content"           `I.p` content_
        ]
  shortShow MessageReplyToStory
    { story_poster_chat_id = story_poster_chat_id_
    , story_id             = story_id_
    }
      = "MessageReplyToStory"
        ++ I.cc
        [ "story_poster_chat_id" `I.p` story_poster_chat_id_
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
        chat_id_           <- o A..:?  "chat_id"
        message_id_        <- o A..:?  "message_id"
        quote_             <- o A..:?  "quote"
        checklist_task_id_ <- o A..:?  "checklist_task_id"
        origin_            <- o A..:?  "origin"
        origin_send_date_  <- o A..:?  "origin_send_date"
        content_           <- o A..:?  "content"
        pure $ MessageReplyToMessage
          { chat_id           = chat_id_
          , message_id        = message_id_
          , quote             = quote_
          , checklist_task_id = checklist_task_id_
          , origin            = origin_
          , origin_send_date  = origin_send_date_
          , content           = content_
          }
      parseMessageReplyToStory :: A.Value -> AT.Parser MessageReplyTo
      parseMessageReplyToStory = A.withObject "MessageReplyToStory" $ \o -> do
        story_poster_chat_id_ <- o A..:?  "story_poster_chat_id"
        story_id_             <- o A..:?  "story_id"
        pure $ MessageReplyToStory
          { story_poster_chat_id = story_poster_chat_id_
          , story_id             = story_id_
          }
  parseJSON _ = mempty

