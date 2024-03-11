module TD.Query.CheckQuickReplyShortcutName
  (CheckQuickReplyShortcutName(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks validness of a name for a quick reply shortcut. Can be called synchronously. Returns 'TD.Data.Ok.Ok'
data CheckQuickReplyShortcutName
  = CheckQuickReplyShortcutName
    { name :: Maybe T.Text -- ^ The name of the shortcut; 1-32 characters
    }
  deriving (Eq, Show)

instance I.ShortShow CheckQuickReplyShortcutName where
  shortShow
    CheckQuickReplyShortcutName
      { name = name_
      }
        = "CheckQuickReplyShortcutName"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON CheckQuickReplyShortcutName where
  toJSON
    CheckQuickReplyShortcutName
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "checkQuickReplyShortcutName"
          , "name"  A..= name_
          ]

