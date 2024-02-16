module TD.Query.SendInlineQueryResultMessage
  (SendInlineQueryResultMessage(..)
  , defaultSendInlineQueryResultMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified Data.Text as T

-- | Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message. Returns 'TD.Data.Message.Message'
data SendInlineQueryResultMessage
  = SendInlineQueryResultMessage
    { chat_id           :: Maybe Int                                     -- ^ Target chat
    , message_thread_id :: Maybe Int                                     -- ^ If not 0, the message thread identifier in which the message will be sent
    , reply_to          :: Maybe InputMessageReplyTo.InputMessageReplyTo -- ^ Information about the message or story to be replied; pass null if none
    , options           :: Maybe MessageSendOptions.MessageSendOptions   -- ^ Options to be used to send the message; pass null to use default options
    , query_id          :: Maybe Int                                     -- ^ Identifier of the inline query
    , result_id         :: Maybe T.Text                                  -- ^ Identifier of the inline query result
    , hide_via_bot      :: Maybe Bool                                    -- ^ Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
    }
  deriving (Eq, Show)

instance I.ShortShow SendInlineQueryResultMessage where
  shortShow
    SendInlineQueryResultMessage
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , reply_to          = reply_to_
      , options           = options_
      , query_id          = query_id_
      , result_id         = result_id_
      , hide_via_bot      = hide_via_bot_
      }
        = "SendInlineQueryResultMessage"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          , "reply_to"          `I.p` reply_to_
          , "options"           `I.p` options_
          , "query_id"          `I.p` query_id_
          , "result_id"         `I.p` result_id_
          , "hide_via_bot"      `I.p` hide_via_bot_
          ]

instance AT.ToJSON SendInlineQueryResultMessage where
  toJSON
    SendInlineQueryResultMessage
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , reply_to          = reply_to_
      , options           = options_
      , query_id          = query_id_
      , result_id         = result_id_
      , hide_via_bot      = hide_via_bot_
      }
        = A.object
          [ "@type"             A..= AT.String "sendInlineQueryResultMessage"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          , "reply_to"          A..= reply_to_
          , "options"           A..= options_
          , "query_id"          A..= fmap I.writeInt64  query_id_
          , "result_id"         A..= result_id_
          , "hide_via_bot"      A..= hide_via_bot_
          ]

defaultSendInlineQueryResultMessage :: SendInlineQueryResultMessage
defaultSendInlineQueryResultMessage =
  SendInlineQueryResultMessage
    { chat_id           = Nothing
    , message_thread_id = Nothing
    , reply_to          = Nothing
    , options           = Nothing
    , query_id          = Nothing
    , result_id         = Nothing
    , hide_via_bot      = Nothing
    }

