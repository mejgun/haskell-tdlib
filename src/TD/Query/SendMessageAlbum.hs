{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendMessageAlbum where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified Utils as U

-- |
-- Sends 2-10 messages grouped together into an album. Currently, only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
data SendMessageAlbum = SendMessageAlbum
  { -- | Pass true to get fake messages instead of actually sending them
    only_preview :: Maybe Bool,
    -- | Contents of messages to be sent. At most 10 messages can be added to an album
    input_message_contents :: Maybe [InputMessageContent.InputMessageContent],
    -- | Options to be used to send the messages; pass null to use default options
    options :: Maybe MessageSendOptions.MessageSendOptions,
    -- | Identifier of a replied message; 0 if none
    reply_to_message_id :: Maybe Int,
    -- | If not 0, a message thread identifier in which the messages will be sent
    message_thread_id :: Maybe Int,
    -- | Target chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendMessageAlbum where
  show
    SendMessageAlbum
      { only_preview = only_preview_,
        input_message_contents = input_message_contents_,
        options = options_,
        reply_to_message_id = reply_to_message_id_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "SendMessageAlbum"
        ++ U.cc
          [ U.p "only_preview" only_preview_,
            U.p "input_message_contents" input_message_contents_,
            U.p "options" options_,
            U.p "reply_to_message_id" reply_to_message_id_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SendMessageAlbum where
  toJSON
    SendMessageAlbum
      { only_preview = only_preview_,
        input_message_contents = input_message_contents_,
        options = options_,
        reply_to_message_id = reply_to_message_id_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "sendMessageAlbum",
          "only_preview" A..= only_preview_,
          "input_message_contents" A..= input_message_contents_,
          "options" A..= options_,
          "reply_to_message_id" A..= reply_to_message_id_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
