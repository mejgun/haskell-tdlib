module TD.Query.EditEphemeralMessageCaption
  (EditEphemeralMessageCaption(..)
  , defaultEditEphemeralMessageCaption
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.FormattedText as FormattedText

-- | Edits the caption and reply markup of an ephemeral message sent by the bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditEphemeralMessageCaption
  = EditEphemeralMessageCaption
    { chat_id                  :: Maybe Int                         -- ^ The chat the message belongs to
    , receiver_user_id         :: Maybe Int                         -- ^ Identifier of the user who received the message
    , ephemeral_message_id     :: Maybe Int                         -- ^ Identifier of the ephemeral message
    , reply_markup             :: Maybe ReplyMarkup.ReplyMarkup     -- ^ The new message reply markup; pass null if none
    , caption                  :: Maybe FormattedText.FormattedText -- ^ New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters
    , show_caption_above_media :: Maybe Bool                        -- ^ Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages
    }
  deriving (Eq, Show)

instance I.ShortShow EditEphemeralMessageCaption where
  shortShow
    EditEphemeralMessageCaption
      { chat_id                  = chat_id_
      , receiver_user_id         = receiver_user_id_
      , ephemeral_message_id     = ephemeral_message_id_
      , reply_markup             = reply_markup_
      , caption                  = caption_
      , show_caption_above_media = show_caption_above_media_
      }
        = "EditEphemeralMessageCaption"
          ++ I.cc
          [ "chat_id"                  `I.p` chat_id_
          , "receiver_user_id"         `I.p` receiver_user_id_
          , "ephemeral_message_id"     `I.p` ephemeral_message_id_
          , "reply_markup"             `I.p` reply_markup_
          , "caption"                  `I.p` caption_
          , "show_caption_above_media" `I.p` show_caption_above_media_
          ]

instance AT.ToJSON EditEphemeralMessageCaption where
  toJSON
    EditEphemeralMessageCaption
      { chat_id                  = chat_id_
      , receiver_user_id         = receiver_user_id_
      , ephemeral_message_id     = ephemeral_message_id_
      , reply_markup             = reply_markup_
      , caption                  = caption_
      , show_caption_above_media = show_caption_above_media_
      }
        = A.object
          [ "@type"                    A..= AT.String "editEphemeralMessageCaption"
          , "chat_id"                  A..= chat_id_
          , "receiver_user_id"         A..= receiver_user_id_
          , "ephemeral_message_id"     A..= ephemeral_message_id_
          , "reply_markup"             A..= reply_markup_
          , "caption"                  A..= caption_
          , "show_caption_above_media" A..= show_caption_above_media_
          ]

defaultEditEphemeralMessageCaption :: EditEphemeralMessageCaption
defaultEditEphemeralMessageCaption =
  EditEphemeralMessageCaption
    { chat_id                  = Nothing
    , receiver_user_id         = Nothing
    , ephemeral_message_id     = Nothing
    , reply_markup             = Nothing
    , caption                  = Nothing
    , show_caption_above_media = Nothing
    }

