module TD.Query.EditChatWelcomeMessage
  (EditChatWelcomeMessage(..)
  , defaultEditChatWelcomeMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits a welcome message of a chat; requires can_send_welcome_messages administrator right in the chat. Returns 'TD.Data.Ok.Ok'
data EditChatWelcomeMessage
  = EditChatWelcomeMessage
    { chat_id               :: Maybe Int                                     -- ^ The identifier of the chat
    , welcome_message_id    :: Maybe Int                                     -- ^ The identifier of the welcome message
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
    }
  deriving (Eq, Show)

instance I.ShortShow EditChatWelcomeMessage where
  shortShow
    EditChatWelcomeMessage
      { chat_id               = chat_id_
      , welcome_message_id    = welcome_message_id_
      , input_message_content = input_message_content_
      }
        = "EditChatWelcomeMessage"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "welcome_message_id"    `I.p` welcome_message_id_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditChatWelcomeMessage where
  toJSON
    EditChatWelcomeMessage
      { chat_id               = chat_id_
      , welcome_message_id    = welcome_message_id_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editChatWelcomeMessage"
          , "chat_id"               A..= chat_id_
          , "welcome_message_id"    A..= welcome_message_id_
          , "input_message_content" A..= input_message_content_
          ]

defaultEditChatWelcomeMessage :: EditChatWelcomeMessage
defaultEditChatWelcomeMessage =
  EditChatWelcomeMessage
    { chat_id               = Nothing
    , welcome_message_id    = Nothing
    , input_message_content = Nothing
    }

