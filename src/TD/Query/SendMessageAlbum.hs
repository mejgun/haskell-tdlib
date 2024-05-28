module TD.Query.SendMessageAlbum
  (SendMessageAlbum(..)
  , defaultSendMessageAlbum
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Sends 2-10 messages grouped together into an album. Currently, only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages. Returns 'TD.Data.Messages.Messages'
data SendMessageAlbum
  = SendMessageAlbum
    { chat_id                :: Maybe Int                                       -- ^ Target chat
    , message_thread_id      :: Maybe Int                                       -- ^ If not 0, the message thread identifier in which the messages will be sent
    , reply_to               :: Maybe InputMessageReplyTo.InputMessageReplyTo   -- ^ Information about the message or story to be replied; pass null if none
    , options                :: Maybe MessageSendOptions.MessageSendOptions     -- ^ Options to be used to send the messages; pass null to use default options
    , input_message_contents :: Maybe [InputMessageContent.InputMessageContent] -- ^ Contents of messages to be sent. At most 10 messages can be added to an album. All messages must have the same value of show_caption_above_media
    }
  deriving (Eq, Show)

instance I.ShortShow SendMessageAlbum where
  shortShow
    SendMessageAlbum
      { chat_id                = chat_id_
      , message_thread_id      = message_thread_id_
      , reply_to               = reply_to_
      , options                = options_
      , input_message_contents = input_message_contents_
      }
        = "SendMessageAlbum"
          ++ I.cc
          [ "chat_id"                `I.p` chat_id_
          , "message_thread_id"      `I.p` message_thread_id_
          , "reply_to"               `I.p` reply_to_
          , "options"                `I.p` options_
          , "input_message_contents" `I.p` input_message_contents_
          ]

instance AT.ToJSON SendMessageAlbum where
  toJSON
    SendMessageAlbum
      { chat_id                = chat_id_
      , message_thread_id      = message_thread_id_
      , reply_to               = reply_to_
      , options                = options_
      , input_message_contents = input_message_contents_
      }
        = A.object
          [ "@type"                  A..= AT.String "sendMessageAlbum"
          , "chat_id"                A..= chat_id_
          , "message_thread_id"      A..= message_thread_id_
          , "reply_to"               A..= reply_to_
          , "options"                A..= options_
          , "input_message_contents" A..= input_message_contents_
          ]

defaultSendMessageAlbum :: SendMessageAlbum
defaultSendMessageAlbum =
  SendMessageAlbum
    { chat_id                = Nothing
    , message_thread_id      = Nothing
    , reply_to               = Nothing
    , options                = Nothing
    , input_message_contents = Nothing
    }

