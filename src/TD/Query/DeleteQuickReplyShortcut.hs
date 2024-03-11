module TD.Query.DeleteQuickReplyShortcut
  (DeleteQuickReplyShortcut(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a quick reply shortcut. Returns 'TD.Data.Ok.Ok'
data DeleteQuickReplyShortcut
  = DeleteQuickReplyShortcut
    { shortcut_id :: Maybe Int -- ^ Unique identifier of the quick reply shortcut
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteQuickReplyShortcut where
  shortShow
    DeleteQuickReplyShortcut
      { shortcut_id = shortcut_id_
      }
        = "DeleteQuickReplyShortcut"
          ++ I.cc
          [ "shortcut_id" `I.p` shortcut_id_
          ]

instance AT.ToJSON DeleteQuickReplyShortcut where
  toJSON
    DeleteQuickReplyShortcut
      { shortcut_id = shortcut_id_
      }
        = A.object
          [ "@type"       A..= AT.String "deleteQuickReplyShortcut"
          , "shortcut_id" A..= shortcut_id_
          ]

