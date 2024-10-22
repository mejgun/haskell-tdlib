module TD.Query.ForwardMessages
  (ForwardMessages(..)
  , defaultForwardMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSendOptions as MessageSendOptions

-- | Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message. Returns 'TD.Data.Messages.Messages'
data ForwardMessages
  = ForwardMessages
    { chat_id           :: Maybe Int                                   -- ^ Identifier of the chat to which to forward messages
    , message_thread_id :: Maybe Int                                   -- ^ If not 0, the message thread identifier in which the message will be sent; for forum threads only
    , from_chat_id      :: Maybe Int                                   -- ^ Identifier of the chat from which to forward messages
    , message_ids       :: Maybe [Int]                                 -- ^ Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously. A message can be forwarded only if messageProperties.can_be_forwarded
    , options           :: Maybe MessageSendOptions.MessageSendOptions -- ^ Options to be used to send the messages; pass null to use default options
    , send_copy         :: Maybe Bool                                  -- ^ Pass true to copy content of the messages without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local. Use messageProperties.can_be_saved and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable
    , remove_caption    :: Maybe Bool                                  -- ^ Pass true to remove media captions of message copies. Ignored if send_copy is false
    }
  deriving (Eq, Show)

instance I.ShortShow ForwardMessages where
  shortShow
    ForwardMessages
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , from_chat_id      = from_chat_id_
      , message_ids       = message_ids_
      , options           = options_
      , send_copy         = send_copy_
      , remove_caption    = remove_caption_
      }
        = "ForwardMessages"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          , "from_chat_id"      `I.p` from_chat_id_
          , "message_ids"       `I.p` message_ids_
          , "options"           `I.p` options_
          , "send_copy"         `I.p` send_copy_
          , "remove_caption"    `I.p` remove_caption_
          ]

instance AT.ToJSON ForwardMessages where
  toJSON
    ForwardMessages
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , from_chat_id      = from_chat_id_
      , message_ids       = message_ids_
      , options           = options_
      , send_copy         = send_copy_
      , remove_caption    = remove_caption_
      }
        = A.object
          [ "@type"             A..= AT.String "forwardMessages"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          , "from_chat_id"      A..= from_chat_id_
          , "message_ids"       A..= message_ids_
          , "options"           A..= options_
          , "send_copy"         A..= send_copy_
          , "remove_caption"    A..= remove_caption_
          ]

defaultForwardMessages :: ForwardMessages
defaultForwardMessages =
  ForwardMessages
    { chat_id           = Nothing
    , message_thread_id = Nothing
    , from_chat_id      = Nothing
    , message_ids       = Nothing
    , options           = Nothing
    , send_copy         = Nothing
    , remove_caption    = Nothing
    }

