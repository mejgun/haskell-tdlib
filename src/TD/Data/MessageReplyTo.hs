{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageReplyTo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about the message or the story a message is replying to
data MessageReplyTo
  = -- | Describes a replied message
    MessageReplyToMessage
      { -- | The identifier of the replied message
        message_id :: Maybe Int,
        -- | The identifier of the chat to which the replied message belongs; ignored for outgoing replies. For example, messages in the Replies chat are replies to messages in different chats
        chat_id :: Maybe Int
      }
  | -- | Describes a replied story @story_sender_chat_id The identifier of the sender of the replied story. Currently, stories can be replied only in the sender's chat @story_id The identifier of the replied story
    MessageReplyToStory
      { -- |
        story_id :: Maybe Int,
        -- |
        story_sender_chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show MessageReplyTo where
  show
    MessageReplyToMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "MessageReplyToMessage"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    MessageReplyToStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "MessageReplyToStory"
        ++ U.cc
          [ U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.FromJSON MessageReplyTo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageReplyToMessage" -> parseMessageReplyToMessage v
      "messageReplyToStory" -> parseMessageReplyToStory v
      _ -> mempty
    where
      parseMessageReplyToMessage :: A.Value -> T.Parser MessageReplyTo
      parseMessageReplyToMessage = A.withObject "MessageReplyToMessage" $ \o -> do
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ MessageReplyToMessage {message_id = message_id_, chat_id = chat_id_}

      parseMessageReplyToStory :: A.Value -> T.Parser MessageReplyTo
      parseMessageReplyToStory = A.withObject "MessageReplyToStory" $ \o -> do
        story_id_ <- o A..:? "story_id"
        story_sender_chat_id_ <- o A..:? "story_sender_chat_id"
        return $ MessageReplyToStory {story_id = story_id_, story_sender_chat_id = story_sender_chat_id_}
  parseJSON _ = mempty

instance T.ToJSON MessageReplyTo where
  toJSON
    MessageReplyToMessage
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "messageReplyToMessage",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    MessageReplyToStory
      { story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "messageReplyToStory",
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
