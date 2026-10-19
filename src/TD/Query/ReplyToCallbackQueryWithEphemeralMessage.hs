module TD.Query.ReplyToCallbackQueryWithEphemeralMessage
  (ReplyToCallbackQueryWithEphemeralMessage(..)
  , defaultReplyToCallbackQueryWithEphemeralMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Replies to a callback query with an ephemeral message; for bots only. Returns 'TD.Data.Ok.Ok'
data ReplyToCallbackQueryWithEphemeralMessage
  = ReplyToCallbackQueryWithEphemeralMessage
    { callback_query_id              :: Maybe Int                                     -- ^ Identifier of the callback query
    , replace_callback_query_message :: Maybe Bool                                    -- ^ Pass true if the ephemeral message must replace the message from which the callback query originated
    , protect_content                :: Maybe Bool                                    -- ^ Pass true if the content of the message must be protected from forwarding and saving
    , reply_markup                   :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The new message reply markup; pass null if none
    , input_message_content          :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
    }
  deriving (Eq, Show)

instance I.ShortShow ReplyToCallbackQueryWithEphemeralMessage where
  shortShow
    ReplyToCallbackQueryWithEphemeralMessage
      { callback_query_id              = callback_query_id_
      , replace_callback_query_message = replace_callback_query_message_
      , protect_content                = protect_content_
      , reply_markup                   = reply_markup_
      , input_message_content          = input_message_content_
      }
        = "ReplyToCallbackQueryWithEphemeralMessage"
          ++ I.cc
          [ "callback_query_id"              `I.p` callback_query_id_
          , "replace_callback_query_message" `I.p` replace_callback_query_message_
          , "protect_content"                `I.p` protect_content_
          , "reply_markup"                   `I.p` reply_markup_
          , "input_message_content"          `I.p` input_message_content_
          ]

instance AT.ToJSON ReplyToCallbackQueryWithEphemeralMessage where
  toJSON
    ReplyToCallbackQueryWithEphemeralMessage
      { callback_query_id              = callback_query_id_
      , replace_callback_query_message = replace_callback_query_message_
      , protect_content                = protect_content_
      , reply_markup                   = reply_markup_
      , input_message_content          = input_message_content_
      }
        = A.object
          [ "@type"                          A..= AT.String "replyToCallbackQueryWithEphemeralMessage"
          , "callback_query_id"              A..= fmap I.writeInt64  callback_query_id_
          , "replace_callback_query_message" A..= replace_callback_query_message_
          , "protect_content"                A..= protect_content_
          , "reply_markup"                   A..= reply_markup_
          , "input_message_content"          A..= input_message_content_
          ]

defaultReplyToCallbackQueryWithEphemeralMessage :: ReplyToCallbackQueryWithEphemeralMessage
defaultReplyToCallbackQueryWithEphemeralMessage =
  ReplyToCallbackQueryWithEphemeralMessage
    { callback_query_id              = Nothing
    , replace_callback_query_message = Nothing
    , protect_content                = Nothing
    , reply_markup                   = Nothing
    , input_message_content          = Nothing
    }

