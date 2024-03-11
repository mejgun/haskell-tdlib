module TD.Query.ReorderQuickReplyShortcuts
  (ReorderQuickReplyShortcuts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the order of quick reply shortcuts. Returns 'TD.Data.Ok.Ok'
data ReorderQuickReplyShortcuts
  = ReorderQuickReplyShortcuts
    { shortcut_ids :: Maybe [Int] -- ^ The new order of quick reply shortcuts
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderQuickReplyShortcuts where
  shortShow
    ReorderQuickReplyShortcuts
      { shortcut_ids = shortcut_ids_
      }
        = "ReorderQuickReplyShortcuts"
          ++ I.cc
          [ "shortcut_ids" `I.p` shortcut_ids_
          ]

instance AT.ToJSON ReorderQuickReplyShortcuts where
  toJSON
    ReorderQuickReplyShortcuts
      { shortcut_ids = shortcut_ids_
      }
        = A.object
          [ "@type"        A..= AT.String "reorderQuickReplyShortcuts"
          , "shortcut_ids" A..= shortcut_ids_
          ]

