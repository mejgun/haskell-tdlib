module TD.Query.EditBusinessMessageCaption
  (EditBusinessMessageCaption(..)
  , defaultEditBusinessMessageCaption
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.FormattedText as FormattedText

-- | Edits the caption of a message sent on behalf of a business account; for bots only. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data EditBusinessMessageCaption
  = EditBusinessMessageCaption
    { business_connection_id   :: Maybe T.Text                      -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                  :: Maybe Int                         -- ^ The chat the message belongs to
    , message_id               :: Maybe Int                         -- ^ Identifier of the message
    , reply_markup             :: Maybe ReplyMarkup.ReplyMarkup     -- ^ The new message reply markup; pass null if none
    , caption                  :: Maybe FormattedText.FormattedText -- ^ New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters
    , show_caption_above_media :: Maybe Bool                        -- ^ Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessMessageCaption where
  shortShow
    EditBusinessMessageCaption
      { business_connection_id   = business_connection_id_
      , chat_id                  = chat_id_
      , message_id               = message_id_
      , reply_markup             = reply_markup_
      , caption                  = caption_
      , show_caption_above_media = show_caption_above_media_
      }
        = "EditBusinessMessageCaption"
          ++ I.cc
          [ "business_connection_id"   `I.p` business_connection_id_
          , "chat_id"                  `I.p` chat_id_
          , "message_id"               `I.p` message_id_
          , "reply_markup"             `I.p` reply_markup_
          , "caption"                  `I.p` caption_
          , "show_caption_above_media" `I.p` show_caption_above_media_
          ]

instance AT.ToJSON EditBusinessMessageCaption where
  toJSON
    EditBusinessMessageCaption
      { business_connection_id   = business_connection_id_
      , chat_id                  = chat_id_
      , message_id               = message_id_
      , reply_markup             = reply_markup_
      , caption                  = caption_
      , show_caption_above_media = show_caption_above_media_
      }
        = A.object
          [ "@type"                    A..= AT.String "editBusinessMessageCaption"
          , "business_connection_id"   A..= business_connection_id_
          , "chat_id"                  A..= chat_id_
          , "message_id"               A..= message_id_
          , "reply_markup"             A..= reply_markup_
          , "caption"                  A..= caption_
          , "show_caption_above_media" A..= show_caption_above_media_
          ]

defaultEditBusinessMessageCaption :: EditBusinessMessageCaption
defaultEditBusinessMessageCaption =
  EditBusinessMessageCaption
    { business_connection_id   = Nothing
    , chat_id                  = Nothing
    , message_id               = Nothing
    , reply_markup             = Nothing
    , caption                  = Nothing
    , show_caption_above_media = Nothing
    }

