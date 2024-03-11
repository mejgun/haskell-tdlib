module TD.Query.LoadQuickReplyShortcutMessages
  (LoadQuickReplyShortcutMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads quick reply messages that can be sent by a given quick reply shortcut. The loaded messages will be sent through updateQuickReplyShortcutMessages. Returns 'TD.Data.Ok.Ok'
data LoadQuickReplyShortcutMessages
  = LoadQuickReplyShortcutMessages
    { shortcut_id :: Maybe Int -- ^ Unique identifier of the quick reply shortcut
    }
  deriving (Eq, Show)

instance I.ShortShow LoadQuickReplyShortcutMessages where
  shortShow
    LoadQuickReplyShortcutMessages
      { shortcut_id = shortcut_id_
      }
        = "LoadQuickReplyShortcutMessages"
          ++ I.cc
          [ "shortcut_id" `I.p` shortcut_id_
          ]

instance AT.ToJSON LoadQuickReplyShortcutMessages where
  toJSON
    LoadQuickReplyShortcutMessages
      { shortcut_id = shortcut_id_
      }
        = A.object
          [ "@type"       A..= AT.String "loadQuickReplyShortcutMessages"
          , "shortcut_id" A..= shortcut_id_
          ]

