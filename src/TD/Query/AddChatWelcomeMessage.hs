module TD.Query.AddChatWelcomeMessage
  (AddChatWelcomeMessage(..)
  , defaultAddChatWelcomeMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Adds a message to the list of welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat. There can be up to getOption("welcome_message_count_max") welcome messages in a chat. Returns 'TD.Data.Ok.Ok'
data AddChatWelcomeMessage
  = AddChatWelcomeMessage
    { chat_id               :: Maybe Int                                     -- ^ The identifier of the chat
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote, inputMessageLocation, inputMessageVenue, inputMessageContact
    }
  deriving (Eq, Show)

instance I.ShortShow AddChatWelcomeMessage where
  shortShow
    AddChatWelcomeMessage
      { chat_id               = chat_id_
      , input_message_content = input_message_content_
      }
        = "AddChatWelcomeMessage"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON AddChatWelcomeMessage where
  toJSON
    AddChatWelcomeMessage
      { chat_id               = chat_id_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "addChatWelcomeMessage"
          , "chat_id"               A..= chat_id_
          , "input_message_content" A..= input_message_content_
          ]

defaultAddChatWelcomeMessage :: AddChatWelcomeMessage
defaultAddChatWelcomeMessage =
  AddChatWelcomeMessage
    { chat_id               = Nothing
    , input_message_content = Nothing
    }

