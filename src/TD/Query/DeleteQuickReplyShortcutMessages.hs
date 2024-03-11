module TD.Query.DeleteQuickReplyShortcutMessages
  (DeleteQuickReplyShortcutMessages(..)
  , defaultDeleteQuickReplyShortcutMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes specified quick reply messages. Returns 'TD.Data.Ok.Ok'
data DeleteQuickReplyShortcutMessages
  = DeleteQuickReplyShortcutMessages
    { shortcut_id :: Maybe Int   -- ^ Unique identifier of the quick reply shortcut to which the messages belong
    , message_ids :: Maybe [Int] -- ^ Unique identifiers of the messages
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteQuickReplyShortcutMessages where
  shortShow
    DeleteQuickReplyShortcutMessages
      { shortcut_id = shortcut_id_
      , message_ids = message_ids_
      }
        = "DeleteQuickReplyShortcutMessages"
          ++ I.cc
          [ "shortcut_id" `I.p` shortcut_id_
          , "message_ids" `I.p` message_ids_
          ]

instance AT.ToJSON DeleteQuickReplyShortcutMessages where
  toJSON
    DeleteQuickReplyShortcutMessages
      { shortcut_id = shortcut_id_
      , message_ids = message_ids_
      }
        = A.object
          [ "@type"       A..= AT.String "deleteQuickReplyShortcutMessages"
          , "shortcut_id" A..= shortcut_id_
          , "message_ids" A..= message_ids_
          ]

defaultDeleteQuickReplyShortcutMessages :: DeleteQuickReplyShortcutMessages
defaultDeleteQuickReplyShortcutMessages =
  DeleteQuickReplyShortcutMessages
    { shortcut_id = Nothing
    , message_ids = Nothing
    }

