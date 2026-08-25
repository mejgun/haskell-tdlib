module TD.Query.EditCallbackQueryMessage
  (EditCallbackQueryMessage(..)
  , defaultEditCallbackQueryMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits the message from which a callback query has originated with an ephemeral message; for bots only. Returns 'TD.Data.Ok.Ok'
data EditCallbackQueryMessage
  = EditCallbackQueryMessage
    { callback_query_id     :: Maybe Int                                     -- ^ Identifier of the callback query
    , protect_content       :: Maybe Bool                                    -- ^ Pass true if the content of the message must be protected from forwarding and saving
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
    }
  deriving (Eq, Show)

instance I.ShortShow EditCallbackQueryMessage where
  shortShow
    EditCallbackQueryMessage
      { callback_query_id     = callback_query_id_
      , protect_content       = protect_content_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "EditCallbackQueryMessage"
          ++ I.cc
          [ "callback_query_id"     `I.p` callback_query_id_
          , "protect_content"       `I.p` protect_content_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditCallbackQueryMessage where
  toJSON
    EditCallbackQueryMessage
      { callback_query_id     = callback_query_id_
      , protect_content       = protect_content_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editCallbackQueryMessage"
          , "callback_query_id"     A..= fmap I.writeInt64  callback_query_id_
          , "protect_content"       A..= protect_content_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]

defaultEditCallbackQueryMessage :: EditCallbackQueryMessage
defaultEditCallbackQueryMessage =
  EditCallbackQueryMessage
    { callback_query_id     = Nothing
    , protect_content       = Nothing
    , reply_markup          = Nothing
    , input_message_content = Nothing
    }

