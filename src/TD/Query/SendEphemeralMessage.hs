module TD.Query.SendEphemeralMessage
  (SendEphemeralMessage(..)
  , defaultSendEphemeralMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageTopic as MessageTopic
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Sends an ephemeral message which will be received only by one bot in a chat. Currently, only ephemeral bot commands and replies to bot ephemeral messages can be sent using the method. The message is persistent across application restarts only if the message database is used. Returns the sent message. Returns 'TD.Data.Message.Message'
data SendEphemeralMessage
  = SendEphemeralMessage
    { chat_id               :: Maybe Int                                     -- ^ Target chat
    , topic_id              :: Maybe MessageTopic.MessageTopic               -- ^ Topic in which the message will be sent; pass null if none
    , receiver_user_id      :: Maybe Int                                     -- ^ Identifier of the user who will receive the message
    , callback_query_id     :: Maybe Int                                     -- ^ Identifier of the callback query which triggered the message; for bots only
    , reply_to              :: Maybe InputMessageReplyTo.InputMessageReplyTo -- ^ Information about the message to be replied; pass null if none. The message can be an incoming ephemeral message
    , sending_id            :: Maybe Int                                     -- ^ Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
    , only_preview          :: Maybe Bool                                    -- ^ Pass true to get a fake message instead of actually sending them
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ Markup for replying to the message; pass null if none; for bots only
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote, inputMessageLocation, inputMessageVenue, inputMessageContact
    }
  deriving (Eq, Show)

instance I.ShortShow SendEphemeralMessage where
  shortShow
    SendEphemeralMessage
      { chat_id               = chat_id_
      , topic_id              = topic_id_
      , receiver_user_id      = receiver_user_id_
      , callback_query_id     = callback_query_id_
      , reply_to              = reply_to_
      , sending_id            = sending_id_
      , only_preview          = only_preview_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "SendEphemeralMessage"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "topic_id"              `I.p` topic_id_
          , "receiver_user_id"      `I.p` receiver_user_id_
          , "callback_query_id"     `I.p` callback_query_id_
          , "reply_to"              `I.p` reply_to_
          , "sending_id"            `I.p` sending_id_
          , "only_preview"          `I.p` only_preview_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON SendEphemeralMessage where
  toJSON
    SendEphemeralMessage
      { chat_id               = chat_id_
      , topic_id              = topic_id_
      , receiver_user_id      = receiver_user_id_
      , callback_query_id     = callback_query_id_
      , reply_to              = reply_to_
      , sending_id            = sending_id_
      , only_preview          = only_preview_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "sendEphemeralMessage"
          , "chat_id"               A..= chat_id_
          , "topic_id"              A..= topic_id_
          , "receiver_user_id"      A..= receiver_user_id_
          , "callback_query_id"     A..= fmap I.writeInt64  callback_query_id_
          , "reply_to"              A..= reply_to_
          , "sending_id"            A..= sending_id_
          , "only_preview"          A..= only_preview_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]

defaultSendEphemeralMessage :: SendEphemeralMessage
defaultSendEphemeralMessage =
  SendEphemeralMessage
    { chat_id               = Nothing
    , topic_id              = Nothing
    , receiver_user_id      = Nothing
    , callback_query_id     = Nothing
    , reply_to              = Nothing
    , sending_id            = Nothing
    , only_preview          = Nothing
    , reply_markup          = Nothing
    , input_message_content = Nothing
    }

