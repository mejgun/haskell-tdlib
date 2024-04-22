module TD.Query.ReaddQuickReplyShortcutMessages
  (ReaddQuickReplyShortcutMessages(..)
  , defaultReaddQuickReplyShortcutMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Readds quick reply messages which failed to add. Can be called only for messages for which messageSendingStateFailed.can_retry is true and after specified in messageSendingStateFailed.retry_after time passed. If a message is readded, the corresponding failed to send message is deleted. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be readded, null will be returned instead of the message. Returns 'TD.Data.QuickReplyMessages.QuickReplyMessages'
data ReaddQuickReplyShortcutMessages
  = ReaddQuickReplyShortcutMessages
    { shortcut_name :: Maybe T.Text -- ^ Name of the target shortcut
    , message_ids   :: Maybe [Int]  -- ^ Identifiers of the quick reply messages to readd. Message identifiers must be in a strictly increasing order
    }
  deriving (Eq, Show)

instance I.ShortShow ReaddQuickReplyShortcutMessages where
  shortShow
    ReaddQuickReplyShortcutMessages
      { shortcut_name = shortcut_name_
      , message_ids   = message_ids_
      }
        = "ReaddQuickReplyShortcutMessages"
          ++ I.cc
          [ "shortcut_name" `I.p` shortcut_name_
          , "message_ids"   `I.p` message_ids_
          ]

instance AT.ToJSON ReaddQuickReplyShortcutMessages where
  toJSON
    ReaddQuickReplyShortcutMessages
      { shortcut_name = shortcut_name_
      , message_ids   = message_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "readdQuickReplyShortcutMessages"
          , "shortcut_name" A..= shortcut_name_
          , "message_ids"   A..= message_ids_
          ]

defaultReaddQuickReplyShortcutMessages :: ReaddQuickReplyShortcutMessages
defaultReaddQuickReplyShortcutMessages =
  ReaddQuickReplyShortcutMessages
    { shortcut_name = Nothing
    , message_ids   = Nothing
    }

