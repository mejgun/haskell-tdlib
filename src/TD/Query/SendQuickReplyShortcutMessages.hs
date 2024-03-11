module TD.Query.SendQuickReplyShortcutMessages
  (SendQuickReplyShortcutMessages(..)
  , defaultSendQuickReplyShortcutMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Sends messages from a quick reply shortcut. Requires Telegram Business subscription. Returns 'TD.Data.Messages.Messages'
data SendQuickReplyShortcutMessages
  = SendQuickReplyShortcutMessages
    { chat_id     :: Maybe Int -- ^ Identifier of the chat to which to send messages. The chat must be a private chat with a regular user
    , shortcut_id :: Maybe Int -- ^ Unique identifier of the quick reply shortcut
    , sending_id  :: Maybe Int -- ^ Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
    }
  deriving (Eq, Show)

instance I.ShortShow SendQuickReplyShortcutMessages where
  shortShow
    SendQuickReplyShortcutMessages
      { chat_id     = chat_id_
      , shortcut_id = shortcut_id_
      , sending_id  = sending_id_
      }
        = "SendQuickReplyShortcutMessages"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "shortcut_id" `I.p` shortcut_id_
          , "sending_id"  `I.p` sending_id_
          ]

instance AT.ToJSON SendQuickReplyShortcutMessages where
  toJSON
    SendQuickReplyShortcutMessages
      { chat_id     = chat_id_
      , shortcut_id = shortcut_id_
      , sending_id  = sending_id_
      }
        = A.object
          [ "@type"       A..= AT.String "sendQuickReplyShortcutMessages"
          , "chat_id"     A..= chat_id_
          , "shortcut_id" A..= shortcut_id_
          , "sending_id"  A..= sending_id_
          ]

defaultSendQuickReplyShortcutMessages :: SendQuickReplyShortcutMessages
defaultSendQuickReplyShortcutMessages =
  SendQuickReplyShortcutMessages
    { chat_id     = Nothing
    , shortcut_id = Nothing
    , sending_id  = Nothing
    }

