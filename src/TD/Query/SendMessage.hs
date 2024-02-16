module TD.Query.SendMessage
  (SendMessage(..)
  , defaultSendMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Sends a message. Returns the sent message. Returns 'TD.Data.Message.Message'
data SendMessage
  = SendMessage
    { chat_id               :: Maybe Int                                     -- ^ Target chat
    , message_thread_id     :: Maybe Int                                     -- ^ If not 0, the message thread identifier in which the message will be sent
    , reply_to              :: Maybe InputMessageReplyTo.InputMessageReplyTo -- ^ Information about the message or story to be replied; pass null if none
    , options               :: Maybe MessageSendOptions.MessageSendOptions   -- ^ Options to be used to send the message; pass null to use default options
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ Markup for replying to the message; pass null if none; for bots only
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent
    }
  deriving (Eq, Show)

instance I.ShortShow SendMessage where
  shortShow
    SendMessage
      { chat_id               = chat_id_
      , message_thread_id     = message_thread_id_
      , reply_to              = reply_to_
      , options               = options_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = "SendMessage"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "message_thread_id"     `I.p` message_thread_id_
          , "reply_to"              `I.p` reply_to_
          , "options"               `I.p` options_
          , "reply_markup"          `I.p` reply_markup_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON SendMessage where
  toJSON
    SendMessage
      { chat_id               = chat_id_
      , message_thread_id     = message_thread_id_
      , reply_to              = reply_to_
      , options               = options_
      , reply_markup          = reply_markup_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "sendMessage"
          , "chat_id"               A..= chat_id_
          , "message_thread_id"     A..= message_thread_id_
          , "reply_to"              A..= reply_to_
          , "options"               A..= options_
          , "reply_markup"          A..= reply_markup_
          , "input_message_content" A..= input_message_content_
          ]

defaultSendMessage :: SendMessage
defaultSendMessage =
  SendMessage
    { chat_id               = Nothing
    , message_thread_id     = Nothing
    , reply_to              = Nothing
    , options               = Nothing
    , reply_markup          = Nothing
    , input_message_content = Nothing
    }

