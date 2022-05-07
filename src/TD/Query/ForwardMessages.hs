{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ForwardMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSendOptions as MessageSendOptions
import qualified Utils as U

-- |
-- Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message
data ForwardMessages = ForwardMessages
  { -- | Pass true to get fake messages instead of actually forwarding them
    only_preview :: Maybe Bool,
    -- | Pass true to remove media captions of message copies. Ignored if send_copy is false
    remove_caption :: Maybe Bool,
    -- | Pass true to copy content of the messages without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local
    send_copy :: Maybe Bool,
    -- | Options to be used to send the messages; pass null to use default options
    options :: Maybe MessageSendOptions.MessageSendOptions,
    -- | Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously
    message_ids :: Maybe [Int],
    -- | Identifier of the chat from which to forward messages
    from_chat_id :: Maybe Int,
    -- | Identifier of the chat to which to forward messages
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ForwardMessages where
  show
    ForwardMessages
      { only_preview = only_preview,
        remove_caption = remove_caption,
        send_copy = send_copy,
        options = options,
        message_ids = message_ids,
        from_chat_id = from_chat_id,
        chat_id = chat_id
      } =
      "ForwardMessages"
        ++ U.cc
          [ U.p "only_preview" only_preview,
            U.p "remove_caption" remove_caption,
            U.p "send_copy" send_copy,
            U.p "options" options,
            U.p "message_ids" message_ids,
            U.p "from_chat_id" from_chat_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON ForwardMessages where
  toJSON
    ForwardMessages
      { only_preview = only_preview,
        remove_caption = remove_caption,
        send_copy = send_copy,
        options = options,
        message_ids = message_ids,
        from_chat_id = from_chat_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "forwardMessages",
          "only_preview" A..= only_preview,
          "remove_caption" A..= remove_caption,
          "send_copy" A..= send_copy,
          "options" A..= options,
          "message_ids" A..= message_ids,
          "from_chat_id" A..= from_chat_id,
          "chat_id" A..= chat_id
        ]
