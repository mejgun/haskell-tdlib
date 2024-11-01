module TD.Query.EditBusinessMessageMedia
  (EditBusinessMessageMedia(..)
  , defaultEditBusinessMessageMedia
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Edits the media content of a message with a text, an animation, an audio, a document, a photo or a video in a message sent on behalf of a business account; for bots only. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data EditBusinessMessageMedia
  = EditBusinessMessageMedia
    { business_connection_id :: Maybe T.Text                                  -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                :: Maybe Int                                     -- ^ The chat the message belongs to
    , message_id             :: Maybe Int                                     -- ^ Identifier of the message
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none; for bots only
    , input_message_content  :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessMessageMedia where
  shortShow
    EditBusinessMessageMedia
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , input_message_content  = input_message_content_
      }
        = "EditBusinessMessageMedia"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "reply_markup"           `I.p` reply_markup_
          , "input_message_content"  `I.p` input_message_content_
          ]

instance AT.ToJSON EditBusinessMessageMedia where
  toJSON
    EditBusinessMessageMedia
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , input_message_content  = input_message_content_
      }
        = A.object
          [ "@type"                  A..= AT.String "editBusinessMessageMedia"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "reply_markup"           A..= reply_markup_
          , "input_message_content"  A..= input_message_content_
          ]

defaultEditBusinessMessageMedia :: EditBusinessMessageMedia
defaultEditBusinessMessageMedia =
  EditBusinessMessageMedia
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    , reply_markup           = Nothing
    , input_message_content  = Nothing
    }

