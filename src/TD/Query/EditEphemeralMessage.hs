module TD.Query.EditEphemeralMessage
  (EditEphemeralMessage(..)
  , defaultEditEphemeralMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits the text, media, or reply markup of an ephemeral message sent by the bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditEphemeralMessage
  = EditEphemeralMessage
    { chat_id               :: Maybe Int                                     -- ^ The chat the message belongs to
    , receiver_user_id      :: Maybe Int                                     -- ^ Identifier of the user who received the message
    , ephemeral_message_id  :: Maybe Int                                     -- ^ Identifier of the ephemeral message
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message; pass null to edit only reply markup. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
    }
  deriving (Eq, Show)

instance I.ShortShow EditEphemeralMessage where
  shortShow
    EditEphemeralMessage
      { chat_id               = chat_id_
      , receiver_user_id      = receiver_user_id_
      , ephemeral_message_id  = ephemeral_message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "EditEphemeralMessage"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "receiver_user_id"      `I.p` receiver_user_id_
          , "ephemeral_message_id"  `I.p` ephemeral_message_id_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditEphemeralMessage where
  toJSON
    EditEphemeralMessage
      { chat_id               = chat_id_
      , receiver_user_id      = receiver_user_id_
      , ephemeral_message_id  = ephemeral_message_id_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editEphemeralMessage"
          , "chat_id"               A..= chat_id_
          , "receiver_user_id"      A..= receiver_user_id_
          , "ephemeral_message_id"  A..= ephemeral_message_id_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]

defaultEditEphemeralMessage :: EditEphemeralMessage
defaultEditEphemeralMessage =
  EditEphemeralMessage
    { chat_id               = Nothing
    , receiver_user_id      = Nothing
    , ephemeral_message_id  = Nothing
    , reply_markup          = Nothing
    , input_message_content = Nothing
    }

